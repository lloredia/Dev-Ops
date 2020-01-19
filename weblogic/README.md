# WEBLOGIC 11G | 12C

## User specific aliases and functions
```
alias ll='ls -larht --color=auto'
alias c='clear'
alias startweblogic='nohup /home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/bin/startWebLogic.sh > /dev/null 2>&1 &'
alias stopweblogic='/home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/bin/stopWebLogic.sh'
alias startnodemanager='nohup /home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/bin/startNodeManager.sh  > /dev/null 2>&1 &'
alias stopnodemanager='/home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/bin/stopNodeManager.sh'
alias nodemanager="/home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/nodemanager"
alias ss='sudo su'
alias ssh='ssh -o ServerAliveInterval=5'
alias t='tmux'
alias reboot='reboot now'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias getpass="openssl rand -base64 20"



```


##  User specific environment and startup programs
```
export WLST_LOC="/home/ec2-user/Oracle/Middleware/Oracle_Home/oracle_common/common/bin/"
```
