# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# Aliases
source ~/dotfiles/aliases.txt

# Visual
eval "$(starship init bash)"
export TERM="xterm-256color"
export XCURSOR_SIZE=24
export HYPRCURSOR_SIZE=24
export HYPRCURSOR_THEME=WhiteSur-cursors

# Editor
export EDITOR=nvim
export VISUAL=nvim

# History
export HISTFILESIZE=500
export HISTSIZE=250
export HISTCONTROL=erasedups:ignoredups:ignorespace
