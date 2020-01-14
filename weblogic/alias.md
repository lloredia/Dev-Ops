# User specific aliases and functions
* alias ll='ls -larht'
* alias c='clear'
* alias startweblogic='nohup /home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/bin/startWebLogic.sh > /dev/null 2>&1 &'
* alias stopweblogic='/home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/bin/stopWebLogic.sh'
* alias startnodemanager='nohup /home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/bin/startNodeManager.sh  > /dev/null 2>&1 &'
* alias stopnodemanager='/home/ec2-user/Oracle/Middleware/Oracle_Home/user_projects/domains/base_domain/bin/stopNodeManager.sh'



# User specific environment and startup programs
```
JAVA_HOME=/home/ec2-user/soft/tutorial/jdk1.8.0_231/
export PATH=$JAVA_HOME/bin:$PATH
```
* export WLST_LOC="/home/ec2-user/Oracle/Middleware/Oracle_Home/oracle_common/common/bin/"
