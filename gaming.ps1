# gaming.ps1 - Installs gaming essentials

# Ensure running as admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as Administrator!"
    exit 1
}

# Install Windows components via winget in a loop
$apps = @(
    "Microsoft.DotNet.DesktopRuntime.8",
    "Microsoft.DotNet.DesktopRuntime.9",
    "Microsoft.VCRedist.2008.x64",
    "Microsoft.VCRedist.2008.x86",
    "Microsoft.VCRedist.2010.x64",
    "Microsoft.VCRedist.2010.x86",
    "Microsoft.VCRedist.2012.x64",
    "Microsoft.VCRedist.2012.x86",
    "Microsoft.VCRedist.2013.x64",
    "Microsoft.VCRedist.2013.x86",
    "Microsoft.VCRedist.2015+.x86",
    "Microsoft.VCRedist.2015+.x64",
    "Microsoft.DirectX",
    "Valve.Steam",
    "th-ch.YouTubeMusic",
    "Discord.Discord"
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

# Download the latest Hydra Launcher setup.exe from GitHub Releases
$hydraApiUrl = "https://api.github.com/repos/hydralauncher/hydra/releases/latest"
$hydraRelease = Invoke-RestMethod -Uri $hydraApiUrl -Headers @{"User-Agent"="request"}
$hydraAsset = $hydraRelease.assets | Where-Object { $_.name -like "*setup.exe" } | Select-Object -First 1

if ($hydraAsset -and $hydraAsset.browser_download_url) {
    $hydraDest = "$env:USERPROFILE\Downloads\$($hydraAsset.name)"
    Invoke-WebRequest -Uri $hydraAsset.browser_download_url -OutFile $hydraDest
    Write-Host "Hydra Launcher downloaded to $hydraDest. Please install manually."
} else {
    Write-Warning "Could not find the latest Hydra Launcher setup.exe in the release assets."
}

# Download and install Vencord for Discord
$vencordUrl = "https://github.com/Vencord/Installer/releases/latest/download/VencordInstaller.exe"
$vencordDest = "$env:USERPROFILE\Downloads\VencordInstaller.exe"
Invoke-WebRequest -Uri $vencordUrl -OutFile $vencordDest

# Kill Discord if running (it may auto-launch after install)
Write-Host "Checking for running Discord processes to close them before Vencord installation..."
Get-Process Discord -ErrorAction SilentlyContinue | ForEach-Object { $_.CloseMainWindow(); Start-Sleep 1; if (!$_.HasExited) { $_.Kill() } }

# Attempt Vencord install for Discord Stable
$discordPath = "$env:LOCALAPPDATA\Discord"
if (Test-Path $discordPath) {
    Write-Host "Vencord Installer will now open. Please click 'Install' in the window, then close it when finished."
    Start-Process -FilePath $vencordDest -ArgumentList "/discordPath `"$discordPath`"" -Wait
    Write-Host "Vencord installation window closed. If you did not click 'Install', please rerun this step."
} else {
    Write-Host "Discord not found at $discordPath. Please install Vencord manually from $vencordDest."
}

$vencordConfigUrl = "https://raw.githubusercontent.com/ctrlcat0x/packages/master/assets/vencord_config.json"
$vencordConfigDest = "$env:USERPROFILE\Downloads\vencord_config.json"
Invoke-WebRequest -Uri $vencordConfigUrl -OutFile $vencordConfigDest
Write-Host "Sample Vencord config downloaded to $vencordConfigDest."

Start-Sleep -Seconds 5
Clear-Host

Write-Host "================================================"
Write-Host "Gaming essentials installed successfully!"
Write-Host "Please setup the following manually:"
Write-Host "1. Hydra Launcher from the Downloads folder"
Write-Host "2. Discord (vencord) using sample config in Downloads folder"
Write-Host "================================================"