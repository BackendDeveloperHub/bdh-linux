#!/bin/bash

# BDH Linux — Package Installer
# Arch/Manjaro only

echo "⚡ bdh-linux — Installing packages..."

BASE_URL="https://raw.githubusercontent.com/BackendDeveloperHub/bdh-linux/main"

# Download packages.txt to /tmp
curl -fsSL "$BASE_URL/packages/packages.txt" -o /tmp/packages.txt

# Read packages.txt and install
while IFS= read -r package; do
    # Skip comments and empty lines
    [[ "$package" =~ ^#.*$ ]] && continue
    [[ -z "$package" ]] && continue

    echo "Installing $package..."
    sudo pacman -S --noconfirm "$package"
done < "/tmp/packages.txt"

# Install pipx for safe CLI tool installation
sudo pacman -S --noconfirm python-pipx

# Install Python packages (Bypassing Arch Linux restriction for global install)
pip install fastapi[standard] uvicorn sqlalchemy psycopg2-binary python-dotenv --break-system-packages

# Install BDH CLI tools using pipx
pipx install bdh-fastapi-new
pipx ensurepath

echo "✅ All packages installed!"
