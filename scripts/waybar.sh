#!/bin/bash

echo "Starting Waybar installation..."

# Update system
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install Waybar and dependencies
echo "Installing Waybar and core dependencies..."
sudo pacman -S --needed --noconfirm waybar swaybg swayidle swaylock grim slurp xdg-desktop-portal-wlr wl-clipboard jq

# Install fonts for Waybar
echo "Installing fonts (Nerd Fonts and Fira Code)..."
sudo pacman -S --needed --noconfirm ttf-nerd-fonts-symbols ttf-fira-code noto-fonts noto-fonts-emoji

# Install additional tools for Waybar modules
echo "Installing tools for system monitoring..."
sudo pacman -S --needed --noconfirm lm_sensors htop playerctl acpi pavucontrol light

# Optional: NVIDIA utilities (for GPU monitoring)
if lspci | grep -i nvidia; then
  echo "NVIDIA GPU detected. Installing NVIDIA utilities..."
  sudo pacman -S --needed --noconfirm nvidia-utils
fi

# Optional: AMD utilities (for GPU monitoring)
if lspci | grep -i amd; then
  echo "AMD GPU detected. Installing AMD utilities..."
  sudo pacman -S --needed --noconfirm vulkan-tools
fi

# Install notification support
echo "Installing notification daemon..."
sudo pacman -S --needed --noconfirm dunst

# Install paru for updates module (optional AUR helper)
if ! command -v paru &>/dev/null; then
  echo "paru not found. Installing paru for updates module..."
  sudo pacman -S --needed --noconfirm base-devel git
  git clone https://aur.archlinux.org/paru.git
  cd paru || exit
  makepkg -si --noconfirm
  cd ..
  rm -rf paru
fi

# Enable services for Wayland session
echo "Enabling required services for Waybar..."
sudo systemctl enable --now dbus.service

# Final check
echo "Verifying installation..."
waybar --version && echo "Waybar installed successfully!" || echo "Waybar installation failed!"

echo "Waybar setup complete. Please configure your Waybar in ~/.config/waybar/"
