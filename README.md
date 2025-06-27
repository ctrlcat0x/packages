# <p align="center">Packages - Windows Essentials Installer</p>

<p align="center">
  <strong>Automate your Windows setup for gaming, coding, and daily use with a single command. Installs all your favorite apps, configures Spotify and Discord mods, and more!</strong>
</p>

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-requirements">Requirements</a> •
  <a href="#-installation--usage">Installation & Usage</a> •
  <a href="#-script-details">Script Details</a> •
  <a href="#-credits">Credits</a>
</p>

---

## ✨ Features

- 🎮 **Gaming Essentials**: Installs Steam, Epic Games Launcher, Discord (with Vencord), Spotify (with SpotX & Spicetify), Hydra Launcher, DirectX, Visual C++ Redistributables, .NET Runtimes, and more
- 💻 **Coding Essentials**: Installs Node.js, Git, 7zip, Cursor, VSCode, Python, GitHub CLI, Windows Terminal, and more
- 🛠️ **Useful Apps**: Installs VLC, qBittorrent, FX Sound, Greenshot, Zen Browser, Chrome, and more
- ⚡ **One-Click Setup**: Run a single PowerShell command to get started
- 📝 **Sample Configs**: Downloads ready-to-use configs for Spicetify and Vencord
- 🧩 **Modular**: Use only the scripts you need
- 🛡️ **Safe & Transparent**: Review all scripts before running

---

## 📋 Requirements

- **Operating System**: Windows 10 or 11
- **PowerShell**: 5.1 or greater
- **winget**: Windows Package Manager (included in recent Windows versions)
- **Administrator Privileges**: Required for app installations

---

## 🚀 Installation & Usage

### Quick Start (One-Liners)
Run any script directly from GitHub in an elevated PowerShell:

### Gaming essentials
```powershell
irm https://raw.githubusercontent.com/ctrlcat0x/packages/master/gaming.ps1 | iex
```

### Coding essentials
```powershell
irm https://raw.githubusercontent.com/ctrlcat0x/packages/master/coding.ps1 | iex
```

### Useful apps
```powershell
irm https://raw.githubusercontent.com/ctrlcat0x/packages/master/apps.ps1 | iex
```

### Manual Method
1. **Clone or Download this repository**
2. **Right-click the script you want to run** (e.g. `gaming.ps1`) and select **Run with PowerShell as Administrator**
3. **Follow any prompts** (e.g. for SpotX, Spicetify, Vencord, or manual installs)

---

## 📜 Script Details

### 🎮 gaming.ps1
- Installs: Steam, Epic Games Launcher, Discord (with Vencord), Spotify (with SpotX & Spicetify), Hydra Launcher, DirectX, Visual C++ Redistributables, .NET Runtimes, and more
- Downloads sample configs for Spicetify and Vencord to your Downloads folder
- Guides you through any manual steps (e.g. Hydra Launcher, Vencord install window)

### 💻 coding.ps1
- Installs: Node.js, Git, 7zip, Cursor, VSCode, Python, GitHub CLI, Windows Terminal, and more

### 🛠️ apps.ps1
- Installs: VLC, qBittorrent, FX Sound, Greenshot, Zen Browser, Chrome, and more

---

## 🙏 Credits
- [SpotX](https://github.com/SpotX-Official/spotx-official.github.io)
- [Spicetify](https://github.com/spicetify/spicetify-cli)
- [Vencord](https://github.com/Vencord/Installer)
- [winget](https://github.com/microsoft/winget-cli)

---

## 📢 Notes
- Some apps (like Hydra Launcher, Vencord, Spicetify) require a manual step or confirmation during install.
- Sample configs are placed in your Downloads folder for easy access.
- Always review scripts before running for your own safety!

---

<p align="center">
  <strong>Made with ❤️ by ctrlcat0x</strong>
</p>
