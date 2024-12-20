# ------# -----------------------------------------------
# Oh My Zsh Configuration
# -----------------------------------------------
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"  # Use the Powerlevel10k theme for a modern prompt

# Plugins
plugins=(
  git                     # Git integration
  zsh-syntax-highlighting # Highlights commands in Zsh
  zsh-autosuggestions     # Suggests commands based on history
  zsh-history-substring-search # Interactive substring search in history
  autosuggestions         # Automatic suggestions
  sudo                    # Enable sudo with !! for last command
)

# Enable Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Powerlevel10k configuration
if [ -f ~/.p10k.zsh ]; then
  source ~/.p10k.zsh
fi

# -----------------------------------------------
# Node Version Manager (fnm) Configuration
# -----------------------------------------------
eval "$(fnm env --use-on-cd)"
fnm use 18

# -----------------------------------------------
# System Info
# -----------------------------------------------
neofetch

# -----------------------------------------------
# Aliases
# -----------------------------------------------
alias ll="ls -lah"            # Human-readable list with all details
alias vim="nvim"              # Use Neovim as the default editor
alias gs="git status"         # Quick git status
alias ga="git add ."          # Add all changes
alias gc="git commit -m"      # Commit with a message
alias gp="git push"           # Push changes
alias copy="wl-copy"          # Clipboard copy for Wayland
alias paste="wl-paste"        # Clipboard paste for Wayland

# -----------------------------------------------
# Environment Variables
# -----------------------------------------------
export EDITOR=nvim
export PATH=$PATH:/usr/local/bin

# -----------------------------------------------
# Rust (Cargo) Configuration
# -----------------------------------------------
export PATH="$PATH:$HOME/.cargo/bin"

# -----------------------------------------------
# PNPM Configuration
# -----------------------------------------------
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# -----------------------------------------------
# NVM Configuration
# -----------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# -----------------------------------------------
# 1Password SSH Agent
# -----------------------------------------------
export SSH_AUTH_SOCK=~/.1password/agent.sock

# -----------------------------------------------
# Custom Functions
# -----------------------------------------------
# Make directory and change into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract various archive types
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Fetch helper
fetch() {
  echo "
const response = await fetch('url', {
	method: 'POST',
	body: JSON.stringify({ object }),
	headers: {
		'Content-Type': 'application/json',
	},
});
"
}

# -----------------------------------------------
# Powerlevel10k Instant Prompt
# -----------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fio "imp
