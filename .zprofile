if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

# Needed for EC2 api tools
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.4.2.2/jars"
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.11.0/jars/"

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

