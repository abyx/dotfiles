alias mysql_start="/usr/local/Cellar/mysql/5.1.49/share/mysql/mysql.server start"
alias code="cd ~/Documents/crowdspot-workspace/crowdspot-parent/"
alias ll='ls -l'
alias resource='source ~/.bash_profile'

function rvm_create {
    rvm use 1.9.2@$1 --create --rvmrc
}
