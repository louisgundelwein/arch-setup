#!/bin/bash

# Install additional tools
echo "Installing additional tools..."
sudo pacman -S --noconfirm \
  firefox \
  gnome-disk-utility \
  file-roller \
  mpv \
  feh
