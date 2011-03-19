#!/bin/bash
source ~/.git-completion.sh

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

source ~/dotfiles/bash_colors.sh
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}
grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local SINCE_LAST_COMMIT="$(minutes_since_last_commit)m"
        # The __git_ps1 function inserts the current git branch where %s is
        echo -e "($(__git_ps1 "%s")|${SINCE_LAST_COMMIT})"
    fi
}
PS1="\[${BRIGHT_GREEN}\]\h\[${NORMAL}\]:\[${BRIGHT_BLUE}\]\W\[${NORMAL}\]\$(grb_git_prompt) \u\$ "

export EDITOR=vim
