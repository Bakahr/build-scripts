# 🚀 Modern Windows 11 Setup Script

This is my personal Windows 11 setup script, built with ❤️, ☕ and Chocolatey.  
It configures my dev environment, installs essential tools, applies system tweaks, and removes Microsoft bloat — all in one go.

> Because "manual install" is a curse word in my house.

---

## 🛠 What It Installs

### Dev Tools
- Git (with Unix tools on path)
- PoshGit
- Sysinternals

### Applications
- Google Chrome
- 7zip
- VSCode
- Spotify
- Discord
- Dropbox
- GitHub Desktop
- Steam
- Obsidian

### System Utilities
- PowerToys
- ShareX
- Wireshark
- Docker for Windows

### Media
- MPC-BE (Media Player Classic Black Edition)

---

## 🧠 System Tweaks

- Enables dark mode
- Disables Cortana and Bing Search
- Disables telemetry (basic level)
- Removes Xbox/Game Bar apps (optional, tweakable)
- Sets up your system for work, not ads

---

## ⚙️ Usage

> ⚠️ Run as Administrator!

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\setup.ps1
