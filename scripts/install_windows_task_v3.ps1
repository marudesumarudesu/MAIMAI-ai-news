$ErrorActionPreference = "Stop"

$TaskName = "YDK MAIMAI AI News GitHub Sync"
$ScriptPath = Join-Path $PSScriptRoot "push_to_github.ps1"

# If Google Drive for desktop has not materialized the helper script locally yet,
# recreate it in the same synced folder.
if (-not (Test-Path -LiteralPath $ScriptPath)) {
    Write-Host "push_to_github.ps1 is not available locally yet."
    Write-Host "Recreating it in this scripts folder..."

    $PushScript = @'
$ErrorActionPreference = "Stop"

# Repository root = parent folder of "scripts"
$RepoPath = Split-Path $PSScriptRoot -Parent
$PostsDir = Join-Path $RepoPath "content\posts"
$DataDir = Join-Path $RepoPath "data"
$PostsJson = Join-Path $DataDir "posts.json"

if (-not (Test-Path $RepoPath)) {
    throw "Repository root was not found: $RepoPath"
}

if (-not (Test-Path (Join-Path $RepoPath ".git"))) {
    throw "This folder is not a Git repository: $RepoPath"
}

if (-not (Test-Path $PostsDir)) {
    New-Item -ItemType Directory -Path $PostsDir -Force | Out-Null
}
if (-not (Test-Path $DataDir)) {
    New-Item -ItemType Directory -Path $DataDir -Force | Out-Null
}

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

# Build data/posts.json automatically from Markdown front matter.
$posts = @()

Get-ChildItem -Path $PostsDir -Filter "*.md" -File | ForEach-Object {
    $lines = Get-Content -LiteralPath $_.FullName -Encoding UTF8
    $fm = @()

    if ($lines.Count -gt 0 -and $lines[0].Trim() -eq "---") {
        for ($i = 1; $i -lt $lines.Count; $i++) {
            if ($lines[$i].Trim() -eq "---") { break }
            $fm += $lines[$i]
        }
    }

    $title = Get-FrontMatterValue $fm "title"
    if ([string]::IsNullOrWhiteSpace($title)) { $title = $_.BaseName }

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
        url        = ("content/posts/" + $_.BaseName + ".html")
    }
}

$posts = $posts | Sort-Object `
    @{Expression = {
        try { [datetime]$_.date } catch { [datetime]::MinValue }
    }; Descending = $true}, `
    @{Expression = "title"; Descending = $false}

$json = ConvertTo-Json -InputObject @($posts) -Depth 5
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($PostsJson, $json, $utf8NoBom)

Set-Location $RepoPath

$changes = git status --porcelain 2>&1
if ($LASTEXITCODE -ne 0) {
    throw "git status failed: $changes"
}

if (-not $changes) {
    Write-Host "No changes. Nothing to push."
    exit 0
}

git add -A
if ($LASTEXITCODE -ne 0) { throw "git add failed." }

$stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "MAIMAI AI news auto update $stamp"
if ($LASTEXITCODE -ne 0) { throw "git commit failed." }

$branch = (git branch --show-current).Trim()
if ([string]::IsNullOrWhiteSpace($branch)) {
    $branch = "main"
}

git push origin $branch
if ($LASTEXITCODE -ne 0) { throw "git push failed." }

Write-Host "GitHub push completed on branch: $branch at $stamp"

'@

    $Utf8Bom = New-Object System.Text.UTF8Encoding($true)
    [System.IO.File]::WriteAllText($ScriptPath, $PushScript, $Utf8Bom)

    if (-not (Test-Path -LiteralPath $ScriptPath)) {
        throw "Could not create push_to_github.ps1: $ScriptPath"
    }

    Write-Host "Created: $ScriptPath"
}

$Schtasks = Join-Path $env:WINDIR "System32\schtasks.exe"
if (-not (Test-Path -LiteralPath $Schtasks)) {
    throw "schtasks.exe was not found: $Schtasks"
}

# /F overwrites an existing task, so there is no delete step.
# /SC MINUTE /MO 15 repeats every 15 minutes indefinitely.
$TaskCommand = 'powershell.exe -NoProfile -ExecutionPolicy Bypass -File "' + $ScriptPath + '"'
$Arguments = '/Create /TN "' + $TaskName + '" /TR "' + $TaskCommand.Replace('"','\"') + '" /SC MINUTE /MO 15 /F'

Write-Host ""
Write-Host "Registering Windows Scheduled Task..."

$proc = Start-Process `
    -FilePath $Schtasks `
    -ArgumentList $Arguments `
    -Wait `
    -PassThru `
    -NoNewWindow

if ($proc.ExitCode -ne 0) {
    throw "Task registration failed. schtasks exit code: $($proc.ExitCode)"
}

Write-Host ""
Write-Host "Scheduled task registered successfully."
Write-Host "Task name : $TaskName"
Write-Host "Interval  : every 15 minutes"
Write-Host "Script    : $ScriptPath"

# Verify it exists.
$verifyArgs = '/Query /TN "' + $TaskName + '"'
$verify = Start-Process `
    -FilePath $Schtasks `
    -ArgumentList $verifyArgs `
    -Wait `
    -PassThru `
    -NoNewWindow

if ($verify.ExitCode -ne 0) {
    throw "The task could not be verified after registration."
}

Write-Host ""
Write-Host "Running one GitHub sync test now..."
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $ScriptPath

Write-Host ""
Write-Host "Setup finished."
