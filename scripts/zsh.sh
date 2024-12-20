#!/bin/bash

# Install and configure Zsh
echo "Installing Zsh..."
sudo pacman -S --noconfirm zsh

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

# Install Zsh plugins
echo "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy Zsh configuration
echo "Copying Zsh configuration..."
cp configs/zshrc ~/.zshrc

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
chsh -s $(which zsh)
