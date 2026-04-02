#!/bin/bash

# BDH Linux — Full Setup Script
# Run this after fresh Manjaro install

echo "⚡ Welcome to bdh-linux Setup!"
echo "================================"

# Step 1 — ZSH setup
echo "🔧 Setting up ZSH..."
sudo pacman -S --noconfirm zsh
chsh -s /bin/zsh

# Step 2 — Oh My Zsh
echo "🔧 Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Step 3 — Copy BDH configs
echo "🔧 Applying BDH configs..."
cp configs/.zshrc ~/.zshrc
cp configs/aliases.sh ~/.aliases.sh

# Step 4 — Install packages
echo "🔧 Installing packages..."
bash scripts/install-packages.sh

# Step 5 — Done
echo ""
echo "✅ bdh-linux Setup Complete!"
echo "================================"
echo "⚡ Restart terminal to apply changes!"