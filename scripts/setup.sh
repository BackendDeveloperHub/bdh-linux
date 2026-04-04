#!/bin/bash

echo "⚡ Welcome to bdh-linux Setup!"
echo "================================"

BASE_URL="https://raw.githubusercontent.com/BackendDeveloperHub/bdh-linux/main"

# Step 1 — ZSH
echo "🔧 Setting up ZSH..."
sudo pacman -S --noconfirm zsh
sudo usermod -s /bin/zsh $USER

# Step 2 — Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🔧 Installing Oh My Zsh..."
  git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
else
  echo "⚡ Oh My Zsh already exists, skipping..."
fi

# Step 3 — BDH Configs
echo "🔧 Applying BDH configs..."
curl -fsSL "$BASE_URL/configs/.zshrc" -o ~/.zshrc
curl -fsSL "$BASE_URL/configs/aliases.sh" -o ~/.aliases.sh

# Step 4 — Packages
echo "🔧 Installing packages..."
curl -fsSL "$BASE_URL/scripts/install-packages.sh" -o /tmp/install-packages.sh
bash /tmp/install-packages.sh

echo ""
echo "✅ bdh-linux Setup Complete!"
echo "================================"
echo "⚡ Restart terminal to apply changes
