#!/bin/bash

sudo subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms
sudo yum update
sudo yum -y install xauth
sudo yum -y install xclock
sudo yum install -y libXtst.x86_64
sudo yum install -y xdpyinfo
sudo yum install xorg-x11-apps
sudo dd if=/dev/zero of=/root/myswapfile bs=1M count=2572

sudo ls -l /root/myswapfile

sudo chmod 600 /root/myswapfile

sudo mkswap /root/myswapfile

sudo swapon /root/myswapfile
        sleep 1
sudo cat  /etc/fstab
sudo swapon -s
        sleep 4
free -k

        sleep 5
#sudo reboot now
