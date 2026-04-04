#!/bin/bash

# BDH Linux — Full Setup Script
# Run this after fresh Manjaro install

echo "⚡ Welcome to bdh-linux Setup!"
echo "================================"

# Get script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

# Step 1 — ZSH setup
echo "🔧 Setting up ZSH..."
sudo pacman -S --noconfirm zsh
chsh -s /bin/zsh

# Step 2 — Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🔧 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "⚡ Oh My Zsh already installed, skipping..."
fi

# Step 3 — Copy BDH configs
echo "🔧 Applying BDH configs..."
cp "$ROOT_DIR/configs/.zshrc" ~/.zshrc
cp "$ROOT_DIR/configs/aliases.sh" ~/.aliases.sh

# Step 4 — Install packages
echo "🔧 Installing packages..."
bash "$ROOT_DIR/scripts/install-packages.sh"

# Step 5 — Done
echo ""
echo "✅ bdh-linux Setup Complete!"
echo "================================"
echo "⚡ Restart terminal to apply chan