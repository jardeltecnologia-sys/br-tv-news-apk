$ErrorActionPreference = "Stop"

Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " BR TV NEWS APK V10 FLASH - envio para GitHub" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$DefaultRemote = "https://github.com/jardeltecnologia-sys/br-tv-news-apk.git"
$Remote = Read-Host "Cole a URL do repositorio GitHub ou aperte ENTER para usar $DefaultRemote"
if ([string]::IsNullOrWhiteSpace($Remote)) { $Remote = $DefaultRemote }

function Add-GitToPathIfNeeded {
  if (Get-Command git -ErrorAction SilentlyContinue) { return }

  $possiblePaths = @(
    "C:\Program Files\Git\cmd",
    "C:\Program Files\Git\bin",
    "C:\Program Files (x86)\Git\cmd",
    "C:\Program Files (x86)\Git\bin"
  )

  foreach ($path in $possiblePaths) {
    if (Test-Path (Join-Path $path "git.exe")) {
      $env:Path = "$path;" + $env:Path
      return
    }
  }
}

Add-GitToPathIfNeeded

if (!(Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Host "Git nao encontrado. Instale: https://git-scm.com/download/win" -ForegroundColor Red
  exit 1
}

if (!(Test-Path ".github\workflows\android-build.yml")) {
  Write-Host "Erro: rode este script dentro da pasta brtvnews." -ForegroundColor Red
  exit 1
}

git config --global user.name "JARDEL CASSIMIRO"
git config --global user.email "jardeltecnologia-sys@users.noreply.github.com"

if (!(Test-Path ".git")) { git init }
git branch -M main

if ((git remote) -contains "origin") {
  git remote set-url origin $Remote
} else {
  git remote add origin $Remote
}

git add .
$hasChanges = git status --porcelain
if ($hasChanges) {
  git commit -m "fix: BR TV NEWS APK v10 flash lightweight"
} else {
  Write-Host "Nada novo para commit. Reenviando estado atual." -ForegroundColor Yellow
}

git push --force -u origin main

Write-Host ""
Write-Host "Envio concluido!" -ForegroundColor Green
Write-Host "Abra: https://github.com/jardeltecnologia-sys/br-tv-news-apk/actions" -ForegroundColor Green
