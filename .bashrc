#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# systemd bottle
if [[ ! -v INSIDE_GENIE ]]; then
    exec /usr/bin/genie -s
fi

# GPG agent
GPG_TTY=$(tty)
export GPG_TTY

# Add colors to ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Git prompt
source /usr/share/git/completion/git-prompt.sh
# Custom colored prompt
PS1='\[\e[31m\][\[\e[m\]\[\e[34m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[33m\]koshi\[\e[m\] \[\e[36m\]\w\[\e[m\]\[\e[32m\]$(__git_ps1 " %s")\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ '

# Dotfiles util alias
alias dot='/usr/bin/git --git-dir=$HOME/dot/ --work-tree=$HOME'
