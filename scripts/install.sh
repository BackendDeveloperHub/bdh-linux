#!/bin/bash

# BDH Linux — One Click Install
# curl -fsSL https://raw.githubusercontent.com/BackendDeveloperHub/bdh-linux/main/install.sh | bash

echo ""
echo "⚡ BDH Linux Installer"
echo "======================"
echo "Backend Developer OS — Arch/Manjaro"
echo ""

# Check OS
if ! command -v pacman &> /dev/null; then
    echo "❌ This is not Arch/Manjaro!"
    echo "bdh-linux supports Arch/Manjaro only."
    exit 1
fi

echo "✅ Arch/Manjaro detected!"
echo ""

# Clone repo
echo "📥 Downloading bdh-linux..."
git clone https://github.com/BackendDeveloperHub/bdh-linux.git ~/.bdh-linux
cd ~/.bdh-linux

# Run setup
echo "🔧 Running setup..."
bash scripts/setup.sh

# Done
echo ""
echo "=============================="
echo "⚡ bdh-linux Install Complete!"
echo "=============================="
echo ""
echo "Run: source ~/.zshrc"
echo "Then: bdh-linux --version"