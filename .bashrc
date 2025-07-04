#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# Visual
eval "$(starship init bash)"
export TERM="xterm-256color"

# Editor
export EDITOR=nvim
export VISUAL=nvim

# Aliases
alias reboot="systemctl reboot"
alias ls="ls -a --color=always --group-directories-first"
alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"

# History
export HISTFILESIZE=500
export HISTSIZE=250
export HISTCONTROL=erasedups:ignoredups:ignorespace
