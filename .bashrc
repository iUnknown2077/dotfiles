export MANPAGER="nvim +Man!"
PATH=$PATH:$HOME/.cargo/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

alias ls="eza -a --icons"
alias update="sudo pacman -Syu"
alias dots="nvim ~/dotfiles"
alias ..="cd .."
alias grep="rg --color=auto"
alias ff="fastfetch"

# export PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
