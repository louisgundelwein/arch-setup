#!/bin/bas#!/bin/bash

# Zsh installation and configuration script

echo "Installing Zsh..."
sudo pacman -S --needed --noconfirm zsh

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh is already installed."
fi

# Install Powerlevel10k
echo "Installing Powerlevel10k theme..."
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
else
  echo "Powerlevel10k is already installed."
fi

# Install Zsh plugins
echo "Installing Zsh plugins..."
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-history-substring-search" ] && git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_CUSTOM/plugins/zsh-history-substring-search"

# Apply .zshrc from the Git repository
echo "Applying custom .zshrc configuration..."
REPO_PATH=$(dirname "$(realpath "$0")")/../configs
if [ -f "$REPO_PATH/.zshrc" ]; then
  cp "$REPO_PATH/.zshrc" ~/.zshrc
  echo "Custom .zshrc has been applied."
else
  echo "Error: .zshrc not found in the Git repository!"
fi

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
chsh -s $(which zsh)

echo "Zsh setup complete. Restart your terminal to use Zsh with the custom configuration."
