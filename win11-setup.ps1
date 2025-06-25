# Modern Windows 11 Setup Script using Chocolatey
# Author: You!
# Description: Prepares a Windows 11 environment with key tweaks and software

# Ensure script is running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Please run this script as Administrator!"
    exit
}

# ----------------------
# Chocolatey Setup
# ----------------------
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Refresh environment
if (Get-Command refreshenv -ErrorAction SilentlyContinue) {
    refreshenv
} else {
    Write-Host "Skipping refreshenv – not available in this shell."
}

# ----------------------
# Dev Tools & Git Setup
# ----------------------
function Install-DevTools {
    Write-Host "Installing developer tools..." -ForegroundColor Cyan

    # Git with Unix tools on path, no shell integration (newer safer params format)
    choco install git -y --params "'/GitAndUnixToolsOnPath /NoShellIntegration'"

    # Skipping Windows Terminal since you use MS Store version
    Write-Host "Windows Terminal is managed via Microsoft Store – skipping Chocolatey install." -ForegroundColor Yellow

    # PowerShell Git prompt support
    choco install poshgit -y

    # Sysinternals tools
    choco install sysinternals -y
}

# ----------------------
# App Installs
# ----------------------

$packages = @(
    "googlechrome",
    "7zip",
    "vscode",
    "spotify",
    "discord",
    "steam",
    "powertoys",
    "dropbox",
    "github-desktop",
    "sysinternals",
    "sharex",
    "docker-for-windows",
    "wireshark",
    "obsidian"
)

foreach ($pkg in $packages) {
    Write-Host "Installing $pkg..." -ForegroundColor Cyan
    try {
        choco install $pkg -y --no-progress --limit-output
    } catch {
        Write-Warning "Failed to install $pkg. Error: $_"
    }
}

# Execute all setup functions
Install-DevTools
Install-Apps

# ----------------------
# System Tweaks
# ----------------------

# Enable Dark Mode
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0

# Disable Bing in Start Menu Search
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Value 1 -Type DWord

# Disable Telemetry (Basic level)
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 1 -Type DWord

# Remove Xbox Game Bar / all Xbox related Apps (not recommended, if you have, e.g, 7950X3D, 9950X3D, then keep it, since Windows/AMD uses it for scheduling of cores for gaming vs productivity)
  Get-AppxPackage *Xbox* | Remove-AppxPackage

# Disable Cortana (registry only)
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -Type DWord

# Set this to $true if you want Game Bar enabled, $false to disable
# $EnableXboxGameBar = $false

# if ($EnableXboxGameBar) {
#    Write-Host "Enabling Xbox Game Bar..." -ForegroundColor Cyan
#   reg add HKCU\Software\Microsoft\GameBar /v AllowAutoGameMode /t REG_DWORD /d 1 /f
#    reg add HKCU\Software\Microsoft\GameBar /v AutoGameModeEnabled /t REG_DWORD /d 1 /f
#    reg add HKCU\Software\Microsoft\GameBar /v ShowStartupPanel /t REG_DWORD /d 1 /f
#    reg add HKCU\Software\Microsoft\Windows\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 1 /f
# } else {
#    Write-Host "Disabling Xbox Game Bar..." -ForegroundColor Yellow
#    reg add HKCU\Software\Microsoft\GameBar /v AllowAutoGameMode /t REG_DWORD /d 0 /f
#    reg add HKCU\Software\Microsoft\GameBar /v AutoGameModeEnabled /t REG_DWORD /d 0 /f
#    reg add HKCU\Software\Microsoft\GameBar /v ShowStartupPanel /t REG_DWORD /d 0 /f
#    reg add HKCU\Software\Microsoft\Windows\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 0 /f
# }

# This removes Game Bar completely
# Get-AppxPackage *XboxGamingOverlay* | Remove-AppxPackage

# ----------------------
# Final Note
# ----------------------
Write-Output "System setup is complete. Please reboot your PC for all changes to take effect."
