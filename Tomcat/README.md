# TOMCAT 

Install the JDK 8u40 and Tomcat Install

Download JDK 8u40 from here:

http://jre.us.oracle.com/java/re/jdk/8u91/promoted/all/RE/latest/bundles/linux-x64/

Download Tomcat 9:

http://apache.spinellicreations.com/tomcat/tomcat-9/v9.0.30/bin/

Setting the environment variables:

```
setenv JAVA_HOME /home/ec2-user/soft/tutorial/jdk1.8.0_231
setenv PATH $JAVA_HOME/bin:$PATH
setenv CATALINA_BASE /scratch/apache-tomcat-9.0.0.M8
setenv CATALINA_HOME /scratch/apache-tomcat-9.0.0.M8
```
Start the Instance:

$CATALINA_HOME/bin/startup.sh

Check if the Instance process started:

ps auxww | grep tomcat
