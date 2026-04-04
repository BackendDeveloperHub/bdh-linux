#!/bin/bash

# BDH Linux — Full Setup Script
# Run this after fresh Manjaro install

echo "⚡ Welcome to bdh-linux Setup!"
echo "================================"

BASE_URL="https://raw.githubusercontent.com/BackendDeveloperHub/bdh-linux/main"

# Step 1 — ZSH setup
echo "🔧 Setting up ZSH..."
sudo pacman -S --noconfirm zsh
sudo chsh -s /bin/zsh $USER

# Step 2 — Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🔧 Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "⚡ Oh My Zsh already exists, skipping..."
fi

# Step 3 — Copy BDH configs
echo "🔧 Applying BDH configs..."
curl -fsSL "$BASE_URL/configs/.zshrc" -o ~/.zshrc
curl -fsSL "$BASE_URL/configs/aliases.sh" -o ~/.aliases.sh

# Step 4 — Install packages
echo "🔧 Installing packages..."
curl -fsSL "$BASE_URL/scripts/install-packages.sh" -o /tmp/install-packages.sh
bash /tmp/install-packages.sh

# Step 5 — Done
echo ""
echo "✅ bdh-linux Setup Complete!"
echo "================================"
echo "⚡ Restart terminal to apply changes!"
