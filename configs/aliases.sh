# BDH Aliases

# FastAPI
alias serve="uvicorn main:app --reload"
alias venv="python -m venv venv && source venv/bin/activate"
alias act="source venv/bin/activate"

# Git
alias gs="git status"
alias gp="git push"
alias ga="git add ."
alias gc="git commit -m"
alias gpl="git pull"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -la"

# BDH Tools
alias new="bdh-fastapi-new"
alias bdh="echo '⚡ BackendDeveloperHub'"

# Python
alias py="python"
alias pip="pip3"

# Docker
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcl="docker-compose logs"

# PostgreSQL
alias pgstart="sudo systemctl start postgresql"
alias pgstop="sudo systemctl stop postgresql"
alias pgstatus="sudo systemctl status postgresql"