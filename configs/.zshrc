# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

PROMPT="%F{cyan}⚡ praba⚡ %F{green}%~%f $ "


# BDH Aliases
[ -f ~/.aliases.sh ] && source ~/.aliases.sh

# Python
export PATH="$HOME/.local/bin:$PATH"

# Editor
export EDITOR="code"
source ~/.bdh-linux/configs/.zshrc
