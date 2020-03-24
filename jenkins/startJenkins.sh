#!/bin/sh
JENKINS_HOME=/app/jenkinsHome
export JENKINS_HOME
nohup java -jar /app/jenkinsApp/jenkins.war --httpPort=8080 --webroot=/app/jenkins >> /app/scripts/logs/logfile 2>&1 &
