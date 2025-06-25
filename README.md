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

```powershell
# 1. Install Chocolatey (if needed)
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# 2. Install Boxstarter
choco install boxstarter -y

# 3. Run the setup script via Boxstarter

# Option A – From local file
Install-BoxstarterPackage -PackageName "C:\Path\To\setup.ps1"

# Option B – From raw GitHub URL
Install-BoxstarterPackage -PackageName "https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/setup.ps1"

   ## 🧙 What This Does (and Doesn’t)

✅ Automates 90% of my setup  
✅ Skips Windows Terminal (I use the MS Store version)  
✅ Reboot-safe thanks to Boxstarter  
❌ Doesn’t teach you PowerShell  
❌ Doesn’t hold your hand unless you’re worthy  

---

## 🗃️ Optional Add-ons (Not Included Yet)

- Wallpaper setting  
- Windows Terminal `settings.json` sync  
- WSL2 installation and Ubuntu setup  
- Dotfiles cloning  

---

## 🧑‍💻 For Nerds and Power Users

Want to fork this? Make your own dotfiles setup? Run this on all your machines with a GitHub repo + Boxstarter? Do it.

Just don’t ask me “how to run a `.ps1` file” — unless you also still use Internet Explorer.

---

## 🏁 Final Words

This script exists so I can reinstall Windows with zero pain, zero bloat, and max efficiency.

If you break something, blame Microsoft. If it works, buy me a coffee. ☕😎

---

📦 **Script maintained by:** [Your Name Here]  
🔗 [Boxstarter.org](https://boxstarter.org) | [Chocolatey.org](https://chocolatey.org)

