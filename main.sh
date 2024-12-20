#!/bin/bash

# Main setup script for Arch Linux with Hyprland

echo "Starting Arch Linux setup with Hyprland..."

# Execute base setup
echo "Executing base setup..."
bash scripts/base.sh

# Install and configure Hyprland
echo "Installing and configuring Hyprland..."
bash scripts/hyprland.sh

# Install and configure Oh My Zsh
echo "Installing and configuring Zsh..."
bash scripts/zsh.sh

# Install and configure LazyVim
echo "Installing and configuring Neovim..."
bash scripts/neovim.sh

# Install additional tools and utilities
echo "Installing additional tools and utilities..."
bash scripts/extras.sh

echo "Setup complete! Please reboot your system to apply all changes."
