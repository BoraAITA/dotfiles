# ~/.bashrc - BoraAITA Configuration

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# Check window size after each command
shopt -s checkwinsize

# Enable color support
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'

# Quick edit
alias eb='nano ~/.bashrc'
alias sb='source ~/.bashrc'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Navigation
alias dev='cd ~/Developer'
alias proj='cd ~/Projects'
alias dl='cd ~/Downloads'

# System
alias update='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install -y'
alias ports='netstat -tulanp'

# Fun
alias weather='curl wttr.in'
alias myip='curl ifconfig.me'

# Auto-complete
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
