# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""          # ← blank பண்ணு, PROMPT override work ஆகும்
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# BDH Cyberpunk Prompt
PROMPT='%F{cyan}⚡bdh-linux%f %F{green}%~%f $ '


# BDH Aliases
[ -f ~/.aliases.sh ] && source ~/.aliases.sh

# Python
export PATH="$HOME/.local/bin:$PATH"

# Editor
export EDITOR="code"