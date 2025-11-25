### Export ###
export MANPAGER="nvim +Man!"
PATH=$PATH:$HOME/.cargo/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


### Aliases ###
alias ls="eza -a --icons"
alias ll="eza -la --icons"

alias pacsyu="sudo pacman -Syu"
alias dots="nvim ~/dotfiles"

alias ..="cd .."
alias ...="cd ../.."
alias grep="rg --color=auto"

alias ff="fastfetch"


### Prompt ###
# export PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
