# JBOSS 

Current Support Versions: wildfly 14.0.1
Install & Download JDK
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
 mv wildfly-14.0.1.Final wildfly
```

By default, WildFly server is binded to 127.0.0.1, you can access it only using 127.0.0.1. So you will need to change binded address to your server IP, if you want to connect WildFly from anywhere on LAN. You can do this by editing standalone.xml file: 
```
vi ./wildfly/standalone/configuration/standalone.xml
```
Change the following lines:
```
<subsystem xmlns="urn:jboss:domain:webservices:2.0">
<wsdl-host>${jboss.bind.address:192.168.0.235}</wsdl-host>
<endpoint-config name="Standard-Endpoint-Config"/>

<interface name="management">
<inet-address value="${jboss.bind.address.management:192.168.0.235}"/>
</interface>

<interface name="public">
<inet-address value=”${jboss.bind.address:192.168.0.235}”/>
</interface>
```
Save and clsoe the file.

Next, you will need to add a user to access the management console. You can add the user by running the following script:
```
./wildfly/bin/add-user.sh
```
Answer all the questions as shown below:
```
What type of user do you wish to add? 
 a) Management User (mgmt-users.properties) 
 b) Application User (application-users.properties)
(a): 

Enter the details of the new user to add.
Using realm 'ManagementRealm' as discovered from the existing property files.
Username : wildflyadmin
Password recommendations are listed below. To modify these restrictions edit the add-user.properties configuration file.
 - The password should be different from the username
 - The password should not be one of the following restricted values {root, admin, administrator}
 - The password should contain at least 8 characters, 1 alphabetic character(s), 1 digit(s), 1 non-alphanumeric symbol(s)
Password : 
Re-enter Password : 
What groups do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[  ]: wildfly
About to add user 'wildflyadmin' for realm 'ManagementRealm'
Is this correct yes/no? yes
Added user 'wildflyadmin' to file '/opt/wildfly/standalone/configuration/mgmt-users.properties'
Added user 'wildflyadmin' to file '/opt/wildfly/domain/configuration/mgmt-users.properties'
Added user 'wildflyadmin' with groups wildfly to file '/opt/wildfly/standalone/configuration/mgmt-groups.properties'
Added user 'wildflyadmin' with groups wildfly to file '/opt/wildfly/domain/configuration/mgmt-groups.properties'
Is this new user going to be used for one AS process to connect to another AS process? 
e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server EJB calls.
yes/no? yes
To represent the user add the following to the server-identities definition 
```

## Access WildFly Console

You will need to start the wildfly instance. You can start it with the following command:
```
./wildfly/bin/standalone.sh
```
The above command will start the wildfly instance.

Now, open your web browser and type the URL http://<ip address>:8080. 

To access the management console, open your web browser and type the URL http://192.168.0.235:9990. 






