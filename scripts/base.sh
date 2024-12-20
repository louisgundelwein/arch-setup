#!/bin/bash

# Update the system and install essential tools
echo "Updating package database and upgrading installed packages..."
sudo pacman -Syu --noconfirm

echo "Installing essential base packages..."
sudo pacman -S --noconfirm \
  base-devel \
  git \
  wget \
  curl \
  htop \
  tmux \
  python \
  python-pip \
  networkmanager \
  xdg-utils \
  xdg-user-dirs

# Enable NetworkManager for internet connectivity
echo "Enabling NetworkManager..."
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
