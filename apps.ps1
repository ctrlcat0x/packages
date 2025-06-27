# useful.ps1 - Installs useful applications

# Ensure running as admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as Administrator!"
    exit 1
}

$apps = @(
    "VideoLAN.VLC",
    "qBittorrent.qBittorrent",
    "Greenshot.Greenshot",
    "Zen-Team.Zen-Browser",
    "Google.Chrome"
)

foreach ($app in $apps) {
    try {
        Write-Host "Installing $app via winget (admin PowerShell)..."
        $wingetArgs = "install --id $app --silent --accept-package-agreements --accept-source-agreements"
        $process = Start-Process -FilePath "winget" -ArgumentList $wingetArgs -Wait -PassThru -NoNewWindow -ErrorAction Stop
        if ($process.ExitCode -eq 0) {
            Write-Host "Successfully installed $app via winget." -ForegroundColor Green
        } else {
            Write-Host "Failed to install $app via winget. Exit code: $($process.ExitCode)" -ForegroundColor Red
        }
    } catch {
        Write-Host "Exception while installing $app via winget: $_" -ForegroundColor Red
    }
}
