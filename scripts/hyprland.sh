#!/bin/bash

# Install Hyprland and related Wayland packages
echo "Installing Hyprland and Wayland dependencies..."
sudo pacman -S --noconfirm \
  hyprland \
  wayland \
  wayland-utils \
  wl-clipboard \
  xdg-desktop-portal-hyprland \
  grim \
  slurp \
  swaybg \
  rofi \
  alacritty \
  mesa \
  sddm

# Configure SDDM as the display manager
echo "Enabling SDDM..."
sudo systemctl enable sddm

# Copy Hyprland configuration
echo "Configuring Hyprland..."
mkdir -p ~/.config/hypr
cp configs/hyprland.conf ~/.config/hypr/hyprland.conf
