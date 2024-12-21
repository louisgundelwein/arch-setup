#!/bin/bash

# Install yay (AUR helper)
echo "Installing yay..."
if ! command -v yay &>/dev/null; then
  sudo pacman -S --needed --noconfirm base-devel git
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay is already installed."
fi

# Install AUR applications
echo "Installing AUR applications..."

# List of AUR applications to install
aur_apps=(
  "1password"              # Password manager
  "visual-studio-code-bin" # Visual Studio Code
  "spotify"                # Spotify client
  "fnm"
)

for app in "${aur_apps[@]}"; do
  if yay -Q "$app" &>/dev/null; then
    echo "$app is already installed."
  else
    echo "Installing $app..."
    yay -S --noconfirm "$app"
  fi
done

echo "All AUR applications have been installed!"
