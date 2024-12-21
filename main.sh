#!/bin/bash

# Main setup script for Arch Linux

echo "Starting Arch Linux setup..."

# Execute base setup
echo "Executing base setup..."
bash scripts/base.sh

# Install and configure GPU drivers
echo "Detecting and installing GPU drivers..."
bash scripts/gpu.sh

# Install and configure Hyprland
echo "Installing and configuring Hyprland..."
bash scripts/hyprland.sh

# Install and configure Neovim
echo "Installing and configuring Neovim..."
bash scripts/neovim.sh

# Install extra utilities and tools
echo "Installing extra utilities..."
bash scripts/extras.sh

# Install yay and AUR applications
echo "Installing yay and AUR applications..."
bash scripts/yay_and_aur_apps.sh

# Install and configure Zsh
echo "Installing and configuring Zsh..."
bash scripts/zsh.sh

echo "Setup complete! Please reboot your system to apply all changes."
