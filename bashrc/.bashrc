# Rust package manager
PATH=$PATH:$HOME/.cargo/bin

# The Missing Package Manager
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# Export attribute for variables
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'


# List directory contents
alias ls="eza -l --icons"
alias la="eza -a --icons"
alias ll="eza -la --icons"

# Package manager utility
alias pacsyu="sudo pacman -Syu"
alias dots="nvim ~/dotfiles"

# Change the working directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias grep="rg --color=auto"

# System information tool
alias ff="fastfetch"

# Shell scripts
alias themes="~/.config/scripts/themes.sh"
alias powermenu="~/.config/scripts/powermenu.sh"


# Prompt
export PS1="\u@\h \w \\$ "
