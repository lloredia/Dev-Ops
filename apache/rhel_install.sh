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

FILE=/var/www/html/index.html
if [ -f "$FILE" ]; then
    echo "$FILE exist"
 else
        echo "$FILE does not exist"
sleep 2
               sudo touch /var/www/html/index.html
        echo "$FILE was just created sucessfully..."
fi
sleep 3
        clear
sudo unlink index.html
ln -s /var/www/html/index.html ./
~

