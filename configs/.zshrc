# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# BDH Aliases
[ -f ~/.aliases.sh ] && source ~/.aliases.sh

# Python / pipx PATH
export PATH="$HOME/.local/bin:$PATH"

# Editor
export EDITOR="code"
