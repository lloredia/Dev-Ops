#!/bin/bash
#MYSQL DB                                                                                                               AUTHOR = lloredia       githuh =  https://github.com/lloredia
#CHANGE ++(DIRECTORIES)
#EDIT   ++(CNF)

wget -v https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.23-linux-glibc2.12-x86_64.tar.gz
sleep 4
        clear
#Unpackage the package file, rename the unpacket directory to “Installation path for MySQL 5.7.23” and then change to this new directory
tar xzvf mysql-5.7.23-linux-glibc2.12-x86_64.tar.gz
sleep 3
        clear
mv -v mysql-5.7.23-linux-glibc2.12-x86_64/ mysql57
sleep 2

cd /home/ec2-user/soft/tutorial/mysql57/

#Create directories log and run
mkdir -v /home/ec2-user/soft/tutorial/mysql57/log
         echo "log dir. created "
sleep 2
mkdir -v /home/ec2-user/soft/tutorial/mysql57/run
        echo "run dir. created"
sleep 2

        echo "sucessfully created +++[ log ] +++[ run ]"
touch  /home/ec2-user/soft/tutorial/mysql57/my.cnf
sleep 2

                echo "sucessfully created config file"
#place the following contents inside the file. Note that database will run with current user
echo '[mysqld]

user=ec2-user
basedir=/home/ec2-user/soft/tutorial/mysql57
datadir=/home/ec2-user/soft/tutorial/mysql57/data
general_log=on
general_log_file=/home/ec2-user/soft/tutorial/mysql57/log/query.log
log-error=/home/ec2-user/soft/tutorial/mysql57/log/error.log
pid-file=/home/ec2-user/soft/tutorial/mysql57/run/mysqld.pid
socket=/home/ec2-user/soft/tutorial/mysql57/run/mysqld.sock' > /home/ec2-user/soft/tutorial/mysql57/my.cnf

sleep 2

#Initialize MySQL directories with following command, this process will create root user with random password
cd /home/ec2-user/soft/tutorial/mysql57/ && ./bin/mysqld --defaults-file=/home/ec2-user/soft/tutorial/mysql57/my.cnf --initialize --console

#You can obtain the random root password to reset after
sudo cat -n /home/ec2-user/soft/tutorial/mysql57/log/error.log
  
                                echo "           ################################################  "                              
                                echo "           ##>>> Please copy out the P.A.S.S.W.O.R.D  <<<##  "
                                echo "           ################################################  "                    
                               
               sleep 5
                                                                        
cd /home/ec2-user/soft/tutorial/mysql57/ && ./bin/mysqld_safe --defaults-file=/home/ec2-user/soft/tutorial/mysql57/my.cnf &
cd /home/ec2-user/soft/tutorial/mysql57/ && ./bin/mysqladmin -u root -S /home/ec2-user/soft/tutorial/mysql57/run/mysqld.sock -p password

