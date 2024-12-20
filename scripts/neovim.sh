#!/bin/bash

# Install Neovim
echo "Installing Neovim..."
sudo pacman -S --noconfirm neovim

# Install LazyVim
echo "Installing LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
