#!/bin/bash
#DOWNLOAD THE FILE
wget -O splunk-8.0.1-6db836e2fb9e-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.1&product=splunk&filename=splunk-8.0.1-6db836e2fb9e-Linux-x86_64.tgz&wget=true'
#UNTAR THE FILE
tar -xvf splunk-8.0.1-6db836e2fb9e-Linux-x86_64.tgz
#START SPLUNK
./splunk/bin/splunk start

