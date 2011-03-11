#!/bin/bash
source ~/.git-completion.sh

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '


# RVM stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

. /usr/local/Cellar/bash-completion/1.2/etc/profile.d/bash_completion.sh

# Do not remember in history commands that start with a space
HISTCONTROL=ignoreboth

export GREP_OPTIONS='--color'
export CLICOLOR='true' # ls colors
