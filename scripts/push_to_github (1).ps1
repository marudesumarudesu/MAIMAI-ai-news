$ErrorActionPreference = "Stop"

$RepoPath = Split-Path $PSScriptRoot -Parent
$PostsDir = Join-Path $RepoPath "content\posts"
$DataDir = Join-Path $RepoPath "data"
$LogDir = Join-Path $RepoPath "logs"
$PostsJson = Join-Path $DataDir "posts.json"
$LogFile = Join-Path $LogDir "github_sync.log"

New-Item -ItemType Directory -Force -Path $LogDir | Out-Null

function Write-Log {
    param([string]$Message)
    $stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "[$stamp] $Message"
    Write-Host $line
    Add-Content -LiteralPath $LogFile -Value $line -Encoding UTF8
}

try {
    Write-Log "START"
    Write-Log "RepoPath=$RepoPath"
    Write-Log "PSScriptRoot=$PSScriptRoot"

    if (-not (Test-Path -LiteralPath $RepoPath)) {
        throw "Repository root not found: $RepoPath"
    }

    if (-not (Test-Path -LiteralPath (Join-Path $RepoPath ".git"))) {
        throw "Not a Git repository: $RepoPath"
    }

    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw "git.exe is not available in PATH for this scheduled task."
    }

    New-Item -ItemType Directory -Force -Path $PostsDir | Out-Null
    New-Item -ItemType Directory -Force -Path $DataDir | Out-Null

    $mdFiles = @(Get-ChildItem -LiteralPath $PostsDir -Filter "*.md" -File -ErrorAction Stop)
    Write-Log ("Markdown files visible to task: " + $mdFiles.Count)

    function Get-FrontMatterValue {
        param(
            [string[]]$Lines,
            [string]$Key
        )
        $pattern = '^\s*' + [regex]::Escape($Key) + '\s*:\s*(.*)\s*$'
        foreach ($line in $Lines) {
            if ($line -match $pattern) {
                $v = $Matches[1].Trim()
                if (($v.StartsWith('"') -and $v.EndsWith('"')) -or
                    ($v.StartsWith("'") -and $v.EndsWith("'"))) {
                    $v = $v.Substring(1, $v.Length - 2)
                }
                return $v
            }
        }
        return ""
    }

    $posts = @()

    foreach ($file in $mdFiles) {
        $lines = Get-Content -LiteralPath $file.FullName -Encoding UTF8
        $fm = @()

        if ($lines.Count -gt 0 -and $lines[0].Trim() -eq "---") {
            for ($i = 1; $i -lt $lines.Count; $i++) {
                if ($lines[$i].Trim() -eq "---") { break }
                $fm += $lines[$i]
            }
        }

        $title = Get-FrontMatterValue $fm "title"
        if ([string]::IsNullOrWhiteSpace($title)) { $title = $file.BaseName }

        $date = Get-FrontMatterValue $fm "date"
        $author = Get-FrontMatterValue $fm "author"
        if ([string]::IsNullOrWhiteSpace($author)) { $author = "AIエンジニア MAIMAI" }

        $category = Get-FrontMatterValue $fm "category"
        $company = Get-FrontMatterValue $fm "company"
        $importance = Get-FrontMatterValue $fm "importance"

        $posts += [pscustomobject]@{
            title      = $title
            date       = $date
            author     = $author
            category   = $category
            company    = $company
            importance = $importance
            url        = ("content/posts/" + $file.BaseName + ".html")
        }
    }

    $posts = @($posts | Sort-Object `
        @{Expression = {
            try { [datetime]$_.date } catch { [datetime]::MinValue }
        }; Descending = $true}, `
        @{Expression = "title"; Descending = $false})

    $json = ConvertTo-Json -InputObject $posts -Depth 5
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($PostsJson, $json, $utf8NoBom)
    Write-Log ("posts.json generated with " + $posts.Count + " entries")

    Set-Location $RepoPath

    $status = git status --porcelain 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "git status failed: $status"
    }

    if (-not $status) {
        Write-Log "No Git changes. END"
        exit 0
    }

    Write-Log ("Git changes detected: " + (($status | Measure-Object).Count))

    git add -A 2>&1 | ForEach-Object { Write-Log "git add: $_" }
    if ($LASTEXITCODE -ne 0) { throw "git add failed." }

    $stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $commitOut = git commit -m "MAIMAI AI news auto update $stamp" 2>&1
    $commitOut | ForEach-Object { Write-Log "git commit: $_" }
    if ($LASTEXITCODE -ne 0) { throw "git commit failed." }

    $branch = (git branch --show-current).Trim()
    if ([string]::IsNullOrWhiteSpace($branch)) { $branch = "main" }

    $pushOut = git push origin $branch 2>&1
    $pushOut | ForEach-Object { Write-Log "git push: $_" }
    if ($LASTEXITCODE -ne 0) { throw "git push failed." }

    Write-Log "SUCCESS. END"
}
catch {
    Write-Log ("ERROR: " + $_.Exception.Message)
    exit 1
}
