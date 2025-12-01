# Rust package manager
set -U fish_user_paths $PATH $HOME/.cargo/bin

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
alias powermenu="~/.config/scripts/powermenu.sh"
alias shell="~/.config/scripts/shell.sh"
alias themes="~/.config/scripts/themes.sh"

# The stupid content tracker
alias ga="git add ."
alias gcl="git clone"
alias gcm="git commit -m"
alias gpl="git pull"
alias gps="git push"


# Prompt
function fish_prompt
  set_color normal
  echo -n $USER"@"$hostname" "(prompt_pwd)" \$ "
end


if status is-interactive
  set fish_greeting
end
