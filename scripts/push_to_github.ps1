# Google Drive for desktop で同期された
# YDK_AI_MEDIA\site フォルダそのものを Git リポジトリとして push するスクリプトです。

$SitePath = "＜ここをGoogle Drive上の YDK_AI_MEDIA\site の実際のWindowsパスに変更＞"

Set-Location $SitePath

if (-not (Test-Path ".git")) {
    Write-Host "このフォルダはまだGitリポジトリではありません。初回のみ git init と remote 設定が必要です。"
    exit 1
}

$changes = git status --porcelain

if (-not $changes) {
    Write-Host "更新なし"
    exit 0
}

git add .
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "MAIMAI AI news update $date"
git push origin main
