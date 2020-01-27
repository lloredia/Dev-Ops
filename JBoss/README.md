# JBOSS 

Current Support Versions: wildfly 14.0.1
Download JDK
```
tar -zxvf jdk-8u221-linux-x64.tar.gz
```
Setting the environment variables:
```
jdk1.8.0_221]$  JAVA_HOME=/home/ec2-user/soft/tutorial/jdk1.8.0_221/
bin]$ export PATH=$JAVA_HOME/bin:$PATH
````
Verify with this command
```
java -version 
```
Output:
```
[ec2-user@ip-172-31-6-121 ~]$ java -version
java version "1.8.0_231"
Java(TM) SE Runtime Environment (build 1.8.0_231-b11)
Java HotSpot(TM) 64-Bit Server VM (build 25.231-b11, mixed mode)
```


## Install WildFly

First, you will need to download the latest version of WildFly from their official website. You can download it with the following command:

```wget http://download.jboss.org/wildfly/14.0.1.Final/wildfly-14.0.1.Final.tar.gz```
```
tar -xvzf wildfly-14.0.1.Final.tar.gz
sudo mv wildfly-14.0.1.Final wildfly
```








