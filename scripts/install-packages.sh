#!/bin/bash

# BDH Linux — Package Installer
# Arch/Manjaro only

echo "⚡ bdh-linux — Installing packages..."

# Read packages.txt and install
while IFS= read -r package; do
    # Skip comments and empty lines
    [[ "$package" =~ ^#.*$ ]] && continue
    [[ -z "$package" ]] && continue
    
    echo "Installing $package..."
    sudo pacman -S --noconfirm "$package"
done < "$(dirname "$0")/../packages/packages.txt"

# Install Python packages
pip install fastapi[standard] uvicorn sqlalchemy psycopg2-binary python-dotenv

# Install BDH CLI tools
pip install bdh-fastapi-new

echo "✅ All packages installed!"