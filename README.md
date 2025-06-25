# 🖥️ Modern Windows 11 Setup Script (Chocolatey + Boxstarter)

Welcome to my personal Windows 11 setup script — a fast, automated way to provision a clean system with all my essential tools, tweaks, and terminal wizardry. No more manually downloading Chrome. No more next > next > finish. Just run the script and chill.

---

## 📦 What's Inside?

### ⚙️ Chocolatey + Boxstarter
- Chocolatey: The Windows package manager
- Boxstarter: Handles reboots, elevation, and long-running installs

### 🧰 Dev Tools
- `git` (with Unix tools in PATH)
- `poshgit` (pretty PowerShell git prompt)
- `sysinternals` (because we do real work here)

### 🌐 Apps
- `googlechrome`
- `7zip`
- `vscode`
- `spotify`
- `discord`
- `steam`
- `dropbox`
- `github-desktop`
- `sharex`
- `docker-for-windows`
- `wireshark`
- `obsidian`

### 🎬 Media
- `mpc-be` (Media Player Classic Black Edition)

### 🧠 System Tweaks
- Enables dark mode
- Disables Bing Search, Cortana, and telemetry (basic level)
- Removes Xbox-related bloatware
- Prepares Windows for a real user, not a Microsoft ad farm

---

## 🚀 How to Use

### 🔧 Prerequisites
- Windows 11 (Pro recommended)
- Administrator rights
- PowerShell knowledge: Optional but appreciated
- A desire to never manually install Spotify again

---

### 📥 Step-by-Step

1. **Install Chocolatey (if needed):**
   Open PowerShell as Admin and run:

   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force
   [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
