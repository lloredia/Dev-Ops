#!/bin/bash

#install apache server in Red Hat Enterprise Linux

sudo yum install -y httpd
        clear
                echo "installation completed... "
sleep 2

 sudo chkconfig httpd on
sleep 2
        clear
 sudo systemctl status httpd
sleep 5
        clear
 sudo systemctl start httpd
 sleep 2
        clear
 sudo systemctl status httpd

