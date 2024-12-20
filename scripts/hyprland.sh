#!/bin/bas#!/bin/bash

# Install NVIDIA drivers and Wayland support
echo "Installing NVIDIA drivers and Wayland dependencies..."
sudo pacman -S --needed --noconfirm \
  nvidia-dkms \
  nvidia-utils \
  nvidia-settings \
  libglvnd \
  egl-wayland \
  mesa \
  vulkan-icd-loader

# Install Hyprland and its dependencies
echo "Installing Hyprland and related Wayland tools..."
sudo pacman -S --needed --noconfirm \
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
  waybar

# Do not copy any custom configuration
echo "Skipping custom Hyprland configuration. Default configuration will be used."
