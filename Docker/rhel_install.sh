#!/bin/bash 
#Installation on rhel(os)
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf repolist -v
 sleep 2
  clear
sudo dnf install -y docker-ce-3:18.09.1-3.el7
 sleep 2
  clear
sudo dnf install --nobest docker-ce -y
 sleep 2
  clear
sudo dnf install -y  https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
                clear
                        echo "Installation is complete..."
                sleep 3
                        clear

sudo systemctl enable docker

sudo systemctl start docker

sudo systemctl status docker


