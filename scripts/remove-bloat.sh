#!/bin/bash

# BDH Linux — Bloatware Remover
# Removes unnecessary apps for Backend Developers

echo "⚡ BDH Linux — Removing bloatware..."
echo "======================================"

# Games
echo "🗑️ Removing games..."
sudo pacman -Rns --noconfirm \
    manjaro-games \
    steam \
    hedgewars

# Office
echo "🗑️ Removing office apps..."
sudo pacman -Rns --noconfirm \
    libreoffice-fresh \
    libreoffice-still

# Media
echo "🗑️ Removing media apps..."
sudo pacman -Rns --noconfirm \
    vlc \
    rhythmbox \
    shotwell

# Other
echo "🗑️ Removing other bloat..."
sudo pacman -Rns --noconfirm \
    transmission-gtk \
    thunderbird

# Clean up
echo "🧹 Cleaning up..."
sudo pacman -Rns --noconfirm $(pacman -Qdtq)
sudo pacman -Scc --noconfirm

echo ""
echo "✅ Bloatware removed!"
echo "💾 Disk space freed!"