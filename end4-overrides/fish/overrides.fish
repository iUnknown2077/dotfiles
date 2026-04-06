# Greeting at start
source ~/.config/fish/greeting.fish

# Exporting variables
set -U fish_user_paths $PATH $HOME/.local/bin

# Export attribute for variables
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export EDITOR="nvim"

# List directory contents
alias ls='eza -l --icons'
alias la='eza -a --icons'
alias ll='eza -la --icons'

# Change the working directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="rg --color=auto"

# System information tool
alias ff="fastfetch"

# The stupid content tracker
alias ga="git add ."
alias gcl="git clone"
alias gcm="git commit -m"
alias gpl="git pull"
alias gps="git push"
