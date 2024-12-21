#!/bin/bash

# Extras installation script

echo "Installing additional utilities and dependencies..."

# Install basic utilities
sudo pacman -S --needed --noconfirm neofetch unzip unrar tar gzip bzip2 p7zip wl-clipboard

# Install fnm (Fast Node Manager)
echo "Installing fnm..."
sudo pacman -S --needed --noconfirm fnm

# Install Rust (Cargo)
echo "Installing Rust..."
sudo pacman -S --needed --noconfirm rust

# Install PNPM
echo "Installing PNPM..."
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Install 1Password
echo "Installing 1Password..."
if ! command -v 1password &>/dev/null; then
  yay -S --noconfirm 1password
else
  echo "1Password is already installed."
fi

# Install LaTeX tools
echo "Installing LaTeX tools..."
sudo pacman -S --needed --noconfirm texlive-bin

# Install development tools for NVM and Node.js
echo "Installing NVM..."
if [ ! -d "$HOME/.nvm" ]; then
  git clone https://github.com/nvm-sh/nvm.git "$HOME/.nvm"
  echo "NVM installed. You may need to reload your terminal."
else
  echo "NVM is already installed."
fi

echo "All additional utilities and dependencies have been installed!"
# Install additional tools
echo "Installing additional tools..."
sudo pacman -S --noconfirm \
  firefox \
  gnome-disk-utility \
  file-roller \
  mpv \
  feh \
  neofetch \
  tldr \
  discord
