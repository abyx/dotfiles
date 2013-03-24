#!/usr/local/bin/zsh
#source ~/.git-completion.sh

# RVM stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Do not remember in history commands that start with a space
HISTCONTROL=ignoreboth

# Colors
export GREP_OPTIONS='--color'
export CLICOLOR='true' # ls colors

export EDITOR=vim

export PATH="/usr/local/bin:${PATH}:$HOME/bin"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
