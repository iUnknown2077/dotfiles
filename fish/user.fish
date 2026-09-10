# Greeting at start
source ~/.config/fish/scripts/greeting.fish

# Exporting variables
fish_add_path $HOME/.local/bin

# Export attribute for variables
set -gx MANPAGER 'nvim +Man!'
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow'
set -gx EDITOR nvim

# List directory contents
alias ls='eza -l --color=always --group-directories-first --icons=always'
alias la='eza -a --color=always --group-directories-first --icons=always'
alias ll='eza -al --color=always --group-directories-first --icons=always'
alias lt='eza -lTL=2 --color=always --group-directories-first --icons=always'

# Core utilities
alias cat="bat -p"

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
