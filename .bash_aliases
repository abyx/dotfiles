alias mysql_start="/usr/local/Cellar/mysql/5.5.10/support-files/mysql.server start"
alias code="cd ~/Documents/crowdspot-workspace/crowdspot-parent/"
alias ll='ls -l'
alias resource='source ~/.bash_profile'

function rvm_create {
    rvm use $(rvm current)@$1 --create --rvmrc
}

alias mongo_start="sudo mongod run --config /usr/local/Cellar/mongodb/1.8.1-x86_64/mongod.conf"

#alias python='/usr/bin/python'
#alias pip=pip-2.6

alias dj_redgreen="redgreen  -t python -- manage.py test --with-growl"

alias btodo="git diff master...HEAD | egrep '^\+.*(TODO|FIXME)'"

alias wireshark="sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark"

alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d ' ' -f2"

if [ -e ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi
