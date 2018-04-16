#!/bin/bash

export TERM=linux

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls='ls -hFG'
alias l='ls -lF'
alias ll='ls -alF'
alias lt='ls -ltrF'
alias ll='ls -alF'
alias lls='ls -alSrF'
alias llt='ls -altrF'

alias tarc='tar cvf'
alias tarcz='tar czvf'
alias tarx='tar xvf'
alias tarxz='tar xvzf'

alias g='git'
alias less='less -R'
alias os='lsb_release -a'
alias vi='vim'

# Colorize directory listing
alias ls='ls --color'
alias l='ls -lrat --color'

# Source common aliases
source $HOME/.scripts/common.do

# Get current git branch
alias __git_current_branch='git rev-parse --abbrev-ref HEAD >& /dev/null && echo "{`git rev-parse --abbrev-ref HEAD`}"'

# Set prompt with git branch name upon sourcing
export PS1="\u@\H[\[\e[33m\]\w\[\e[m\]]\[\033[1;31m\]`__git_current_branch`\[\033[m\] : "