# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

#Autosuggestions
[[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] \
  && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Power 10k
[[ -r ~/powerlevel10k/powerlevel10k.zsh-theme ]] \
  && source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

export PATH="/usr/local/bin/:$PATH"

# Colorful aliases for common commands
alias cfgzsh='nvim ~/.zshrc'
alias srczsh='source ~/.zshrc'
alias l='ls -Flah --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
# Color for Arch + OS i can add in the future
if [[ -f /etc/os-release ]]; then
  OS=$(grep '^ID=' /etc/os-release | cut -d= -f2)
  if [[ "$OS" == "arch" ]]; then
    alias pacman='pacman --color=auto'
  fi
fi

# Function to navigate to the root of the project
cd_root() {
  # Find the root of the project (assumes a git repo or `pnpm-workspace.yaml` exists)
  local project_root=$(git rev-parse --show-toplevel 2>/dev/null || find . -name "pnpm-workspace.yaml" -exec dirname {} \; | head -n 1)
  
  if [[ -n "$project_root" ]]; then
    cd "$project_root" || return
    echo "Moved to project root: $project_root"
  else
    echo "Error: Could not find the project root. Ensure you're inside a Git repo or workspace."
  fi
}

# Alias `cd root` to the function
alias 'cdroot'='cd_root'

#Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/home/kris/.bun/_bun" ] && source "/home/kris/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Relative directory
DOTFILES_DIR=$(dirname "$(realpath "${(%):-%N}")")
# Source .secrets file if it exists using the relative path
SECRETS_FILE="$DOTFILES_DIR/.secrets"


if [ -f "$SECRETS_FILE" ]; then
    source "$SECRETS_FILE"
fi

# To Disable the 'Spoink' sound
unsetopt BEEP

# Source Android SDK Path
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Source NVM
[[ -r /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
