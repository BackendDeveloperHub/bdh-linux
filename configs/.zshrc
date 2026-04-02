# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# BDH Prompt
PROMPT='%F{cyan}⚡bdh-linux%f %F{green}%~%f $ '

# BDH Aliases
source ~/bdh-linux/configs/aliases.sh

# Python
export PATH="$HOME/.local/bin:$PATH"

# Editor
export EDITOR="code"