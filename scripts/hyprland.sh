#!/bin#!/bin/bash

# Hyprland installation and configuration script

echo "Installing Hyprland and dependencies..."
sudo pacman -S --needed --noconfirm hyprland wayland wayland-utils xdg-desktop-portal-hyprland grim slurp swaybg wl-clipboard

# Create Hyprland configuration directory
echo "Setting up Hyprland configuration..."
mkdir -p ~/.config/hypr

# Copy custom Hyprland configuration
REPO_PATH=$(dirname "$(realpath "$0")")/../configs
if [ -f "$REPO_PATH/hypr/hyprland.conf" ]; then
  cp "$REPO_PATH/hypr/hyprland.conf" ~/.config/hypr/hyprland.conf
  echo "Hyprland configuration has been applied."
else
  echo "Error: Hyprland configuration not found!"
fi

# Copy wallpaper if present
if [ -d "$REPO_PATH/hypr/wallpapers" ]; then
  mkdir -p ~/Pictures/wallpapers
  cp -r "$REPO_PATH/hypr/wallpapers"/* ~/Pictures/wallpapers/
  echo "Wallpapers copied."
fi

echo "Hyprland setup complete."
