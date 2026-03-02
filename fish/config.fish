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

# Prompt
function fish_prompt -d "write out the prompt"
    set_color normal
    echo -n " 󰇧 "
    set_color normal
    echo -n " [ "
    set_color normal
    echo -n (prompt_pwd)
    set_color normal
    echo -n " ] \$ "
end

if status is-interactive
    set fish_greeting
end
