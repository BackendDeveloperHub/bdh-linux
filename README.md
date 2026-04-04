# BDH Linux 🐧⚡

> Backend Developer-ku specific Linux setup — Arch/Manjaro based

## What is BDH Linux?

BDH Linux is a custom developer environment built on top of
Manjaro/Arch Linux, designed specifically for Backend Developers.
Install once — start coding immediately!

## Features

- Cyberpunk/Dark terminal theme
- Python, FastAPI, PostgreSQL pre-configured
- BDH custom ZSH prompt
- BDH aliases (serve, venv, gp...)
- bdh-fastapi-new pre-installed
- Bloatware removed

## Quick Install

**Recommended (Arch/Manjaro):**
```bash
pipx install bdh-linux
Alternative:
pip install bdh-linux --break-system-packages
Note: On Arch/Manjaro, use pipx or --break-system-packages flag.
Install pipx first: sudo pacman -S python-pipx
After Install
Run the setup script to apply configs:
bash scripts/setup.sh
Then restart your terminal to activate the BDH environment.
Stack
Base OS: Manjaro (Arch-based)
Shell: ZSH + Oh My Zsh
Language: Python 3.12+
Framework: FastAPI
DB: PostgreSQL
Project Structure
configs/     → ZSH, aliases, prompt
packages/    → Pre-install package list
scripts/     → Setup & install scripts
themes/      → Wallpaper & GTK theme
cli/         → bdh-linux PyPI tool
Contributing
Pull requests are welcome!
If you find a bug or have a feature idea, open an issue on GitHub.
License
MIT License — free to use and modify.
Author
Prabakaran — BackendDeveloperHub
GitHub: github.com/BackendDeveloperHub
PyPI: bdh-fastapi-new