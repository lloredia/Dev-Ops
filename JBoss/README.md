# JBOSS 

Current Support Versions:

The Redhat EAP versions can be downloaded from https://developers.redhat.com/products/eap/download/.

The current supported versions for Monitoring Services are JBoss AS 7.5.10 and 7.2.1 (EAP 6.1.1 and EAP 6.4).They all require to run on JDK 7
Install JDK & JBoss:

Download JDK 7 for JBoss AS 7 (EAP 6.x):

tar -xzvf jdk-7u80-linux-x64.tar.gz

Setting the environment variables:

setenv JAVA_HOME /scratch/jdk1.7.0_80

setenv PATH $JAVA_HOME/bin:$PATH

To Install JBoss AS 7.5.10 and 7.2.1:

You can easily download the zip files and unzipping in to a directory.

unzip jboss-eap-6.1.0.zip / jboss-eap-6.4.0.zip

setenv JBOSS_HOME <unziped jboss directory>
Standalone non-SSL:

Standalone configuration files (doesn't matter for support Monitoring):

    standalone.xml: Support of Java EE Web-Profile plus some extensions like RESTFul Web Services and support for EJB3 remote invocations
    standalone-full.xml: Support of Java EE Full-Profile and all server capabilities without clustering
    standalone-ha.xml: Default profile with clustering capabilities
    standalone-full-ha.xml: Full profile with clustering capabilities

To start JBoss AS Standalone mode non-SSL:

sh $JBOSS_HOME/bin/standalone.sh -c standalone-full.xml -b=0.0.0.0 -bmanagement=0.0.0.0

 

Using port-offset:

cp -a $JBOSS_HOME/standalone $JBOSS_HOME/standalone-server1

cp -a $JBOSS_HOME/standalone $JBOSS_HOME/standalone-server2

sh $JBOSS_HOME/bin/standalone.sh -Djboss.server.base.dir=$JBOSS_HOME/standalone-server1 -Djboss.socket.binding.port-offset=100 -c standalone-full.xml -b=0.0.0.0 -bmanagement=0.0.0.0

sh $JBOSS_HOME/bin/standalone.sh -Djboss.server.base.dir=$JBOSS_HOME/standalone-server2 -Djboss.socket.binding.port-offset=200 -c standalone-full.xml -b=0.0.0.0 -bmanagement=0.0.0.0

 

Add Managerment User which is the minimum requirement for monitoring Standalone Mode non-SSL:

In this case,
*Adding Management User
```
$ ./add-user.sh
What type of user do you wish to add?
 a) Management User (mgmt-users.properties)
 b) Application User (application-users.properties)
(a): a
Enter the details of the new user to add.
Using realm 'ManagementRealm' as discovered from the existing property files.
Username : admin
Password recommendations are listed below. To modify these restrictions edit the add-user.properties configuration file.
 - The password should be different from the username
 - The password should not be one of the following restricted values {root, admin, administrator}
 - The password should contain at least 8 characters, 1 alphabetic character(s), 1 digit(s), 1 non-alphanumeric symbol(s)
Password :
Re-enter Password :
What groups do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[  ]:
About to add user 'adminUser' for realm 'ManagementRealm'
Is this correct yes/no? yes
Added user 'adminUser' to file '/scratch/dmgilber/jboss/clean/wildfly-10.1.0.Final/standalone/configuration/mgmt-users.properties'
Added user 'adminUser' to file '/scratch/dmgilber/jboss/clean/wildfly-10.1.0.Final/domain/configuration/mgmt-users.properties'
Added user 'adminUser' with groups  to file '/scratch/dmgilber/jboss/clean/wildfly-10.1.0.Final/standalone/configuration/mgmt-groups.properties'
Added user 'adminUser' with groups  to file '/scratch/dmgilber/jboss/clean/wildfly-10.1.0.Final/domain/configuration/mgmt-groups.properties'
Is this new user going to be used for one AS process to connect to another AS process?
e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server EJB calls.
yes/no? no
  
NOTES:
  
- The default password I use on my setup is password1! in order to meet the password policy rules.
- Not using any groups at this time
- No setup as master/slave controller configuration
```
service:jmx:remoting-jmx://slc06rsn.us.oracle.com:9443

service:jmx:remoting-jmx://slc06rso.us.oracle.com:9999
Domain mode

service:jmx:remoting-jmx://<hostname>:9999 (This is JMX to the domain, need to use the management username/password)

service:jmx:remoting-jmx://<hostname>:4447+offset (This is JMX to the server, need to use the application username/password)

Without Port offset, in default start up:

sh $JBOSS_HOME/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0

With Port offset:

sh $JBOSS_HOME/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.management.http.port=9991 -Djboss.management.native.port=9992

Then change port offset for socket-binding in host.xml.

 

Add Management User:

*Adding Management User
```
$ ./add-user.sh
What type of user do you wish to add?
 a) Management User (mgmt-users.properties)
 b) Application User (application-users.properties)
(a): a
Enter the details of the new user to add.
Using realm 'ManagementRealm' as discovered from the existing property files.
Username : adminUser
Password recommendations are listed below. To modify these restrictions edit the add-user.properties configuration file.
 - The password should be different from the username
 - The password should not be one of the following restricted values {root, admin, administrator}
 - The password should contain at least 8 characters, 1 alphabetic character(s), 1 digit(s), 1 non-alphanumeric symbol(s)
Password :
Re-enter Password :
What groups do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[  ]:
About to add user 'adminUser' for realm 'ManagementRealm'
Is this correct yes/no? yes
Added user 'adminUser' to file '/scratch/dmgilber/jboss/clean/wildfly-10.1.0.Final/standalone/configuration/mgmt-users.properties'
Added user 'adminUser' to file '/scratch/dmgilber/jboss/clean/wildfly-10.1.0.Final/domain/configuration/mgmt-users.properties'
Added user 'adminUser' with groups  to file '/scratch/dmgilber/jboss/clean/wildfly-10.1.0.Final/standalone/configuration/mgmt-groups.properties'
Added user 'adminUser' with groups  to file '/scratch/dmgilber/jboss/clean/wildfly-10.1.0.Final/domain/configuration/mgmt-groups.properties'
Is this new user going to be used for one AS process to connect to another AS process?
e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server EJB calls.
yes/no? no
  
NOTES:
  
- The default password I use on my setup is password1! in order to meet the password policy rules.
- Not using any groups at this time
- No setup as master/slave controller configuration
```
After creating the management user, the default management users are stored in the file depending on running mode:

Domain Mode - $JBOSS_HOME/domain/configuration/mgmt-users.properties

Standalone Mode - $JBOSS_HOME/standalone/configuration/mgmt-users.properties

 
 # SSL
 
 Reference

https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/6.4/html-single/how_to_configure_server_security/

``` 
This is one way to generate a keystore. You can change to better names.
keytool -genkeypair -alias jboss -storetype jks -keyalg RSA -keysize 2048 -keypass changeit -keystore eap6console.jks -storepass changeit -dname "CN=appserver, OU=Development, O=Management Cloud, L=Nashua, ST=NH, C=US" -validity 730 -v
 
Verify keystore (optional)
   
$ keytool -list -v -keystore eap6console.jks
   
Generating the certificate
   
keytool -export -keystore eap6console.jks -alias jboss -file jboss.cer -keypass changeit -storepass changeit
   
NOTE: You can do this once for standalone and just copy the keystore jks and cer file to the domain configuration directory.
```

```
 STANDALONE MODE (Not for 6.1):
touch $JBOSS_HOME/standalone/configuration/httpsrealm-users.properties
 
DOMAIN MODE (Not for 6.1):
touch $JBOSS_HOME/domain/configuration/httpsrealm-users.properties
 
STANDALONE MODE:
sh $JBOSS_HOME/bin/standalone.sh -c standalone-full.xml -b=0.0.0.0 -bmanagement=0.0.0.0
 
DOMAIN MODE:
sh $JBOSS_HOME/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0
 
 
(Not for 6.1):
sh $JBOSS_HOME/bin/add-user.sh -u admin -p password1! --user-properties httpsrealm-users.properties --realm HttpsRealm
sh $JBOSS_HOME/bin/add-user.sh -a -u test1 -p password1! --user-properties httpsrealm-users.properties --realm HttpsRealm
 
sh $JBOSS_HOME/bin/jboss-cli.sh --connect
 
 
STANDALONE MODE 6.4:
/core-service=management/security-realm=HttpsRealm/:add
/core-service=management/security-realm=HttpsRealm/server-identity=ssl:add(keystore-path="eap6console.jks", keystore-password="changeit", key-password="changeit", alias="jboss", keystore-relative-to=jboss.server.config.dir)
/core-service=management/security-realm=HttpsRealm/authentication=properties/:add(path=httpsrealm-users.properties,relative-to=jboss.server.config.dir, plain-text=false)
:reload
 
STANDALONE MODE 6.1 (Because cannot add another secure realm didn't work, therefore use ManagementRealm and bind to ssl):
/core-service=management/security-realm=ManagementRealm/server-identity=ssl:add(keystore-path="eap6console.jks", keystore-password="changeit", key-password="changeit", alias="jboss", keystore-relative-to=jboss.server.config.dir)
:reload
 
STANDALONE MODE 6.4:
/core-service=management/management-interface=http-interface:write-attribute(name=security-realm,value=HttpsRealm)
/core-service=management/management-interface=http-interface:write-attribute( name=secure-socket-binding, value=management-https)
 
/subsystem=web/connector=HTTPS/:add(socket-binding=https,scheme=https, protocol=HTTP/1.1, secure=true)
/subsystem=web/connector=HTTPS/ssl=configuration:add(name=https,certificate-key-file="${jboss.server.config.dir}/eap6console.jks",password=changeit, key-alias=jboss)
/subsystem=web/connector=HTTPS/ssl=configuration/:write-attribute( name=protocol,value=TLSv1)
:reload
 
STANDALONE MODE 6.1:
/core-service=management/management-interface=http-interface:write-attribute(name=security-realm,value=ManagementRealm)
/core-service=management/management-interface=http-interface:write-attribute( name=secure-socket-binding, value=management-https)
 
/subsystem=web/connector=HTTPS/:add(socket-binding=https,scheme=https, protocol=HTTP/1.1, secure=true)
/subsystem=web/connector=HTTPS/ssl=configuration:add(name=https,certificate-key-file="${jboss.server.config.dir}/eap6console.jks",password=changeit, key-alias=jboss)
/subsystem=web/connector=HTTPS/ssl=configuration/:write-attribute( name=protocol,value=TLSv1)
:reload
 
sh $JBOSS_HOME/bin/add-user.sh -u admin -p password1!
sh $JBOSS_HOME/bin/add-user.sh -a -u test1 -p password1!
 
DOMAIN MODE (6.4):
(Add SSL to HttpsRealm)
/host=master/core-service=management/security-realm=HttpsRealm/:add
/host=master/core-service=management/security-realm=HttpsRealm/server-identity=ssl:add(keystore-path="eap6console.jks", keystore-password="changeit", key-password="changeit", alias="jboss", keystore-relative-to=jboss.domain.config.dir)
/host=master/core-service=management/security-realm=HttpsRealm/authentication=properties:add(path=httpsrealm-users.properties, relative-to=jboss.domain.config.dir, plain-text=false)
/host=master:reload
 
(Add SSL to ApplicationRealm)
/host=master/core-service=management/security-realm=ApplicationRealm/server-identity=ssl:add(keystore-path="eap6console.jks", keystore-password="changeit", key-password="changeit", alias="jboss", keystore-relative-to=jboss.domain.config.dir)
 
DOMAIN MODE (6.1):
(Add SSL to ManagementRealm)
/host=master/core-service=management/security-realm=ManagementRealm/server-identity=ssl:add(keystore-path="eap6console.jks", keystore-password="changeit", key-password="changeit", alias="jboss", keystore-relative-to=jboss.domain.config.dir)
/host=master:reload
 
(Add SSL to ApplicationRealm)
/host=master/core-service=management/security-realm=ApplicationRealm/server-identity=ssl:add(keystore-path="eap6console.jks", keystore-password="changeit", key-password="changeit", alias="jboss", keystore-relative-to=jboss.domain.config.dir)
 
 
DOMAIN MODE (6.4):
/host=master/core-service=management/management-interface= http-interface/:write-attribute(name=security-realm,value=HttpsRealm)
/host=master/core-service=management/management-interface= http-interface:write-attribute(name=secure-port,value=9443)
/host=master/core-service=management/management-interface= http-interface:undefine-attribute(name=port)
 
/profile=full/subsystem=web/connector=HTTPS/:add(socket-binding=https, scheme=https, protocol=HTTP/1.1, secure=true)
/profile=full/subsystem=web/connector=HTTPS/ssl=configuration:add(name=https,certificate-key-file="${jboss.domain.config.dir}/eap6console.jks",password=changeit, key-alias=jboss)
/profile=full/subsystem=web/connector=HTTPS/ssl=configuration/:write-attribute(name=protocol,value=TLSv1)
/host=master:reload
 
DOMAIN MODE (6.1):
/host=master/core-service=management/management-interface= http-interface/:write-attribute(name=security-realm,value=ManagementRealm)
/host=master/core-service=management/management-interface= http-interface:write-attribute(name=secure-port,value=9443)
/host=master/core-service=management/management-interface= http-interface:undefine-attribute(name=port)
 
/profile=full/subsystem=web/connector=HTTPS/:add(socket-binding=https, scheme=https, protocol=HTTP/1.1, secure=true)
/profile=full/subsystem=web/connector=HTTPS/ssl=configuration:add(name=https,certificate-key-file="${jboss.domain.config.dir}/eap6console.jks",password=changeit, key-alias=jboss)
/profile=full/subsystem=web/connector=HTTPS/ssl=configuration/:write-attribute(name=protocol,value=TLSv1)
/host=master:reload
 
sh $JBOSS_HOME/bin/add-user.sh -u admin -p password1!
sh $JBOSS_HOME/bin/add-user.sh -a -u test1 -p password1!
 
 
 
 
 
/host=master/core-service=management/management-interface= http-interface/:write-attribute(name=security-realm,value=ManagementRealm)
/host=master/core-service=management/management-interface= http-interface:write-attribute(name=secure-port,value=9443)
/host=master/core-service=management/management-interface= http-interface:undefine-attribute(name=port)
 
 
#Adding a new server autostart:
/host=master/server-config=server-4:add(auto-start=true, group=other-server-group, socket-binding-port-offset=550)
 
#Start a new server:
/host=master/server-config=server-4/:start(server=server-4,blocking=false)
#Stop a server:
/host=master/server-config=server-4/:stop(server=server-4,blocking=false)
#Delete a server:
/host=master/server-config=server-4/:remove
 
sh jboss-cli.sh --connect "/host=master/server-config=server-4:add(auto-start=true, group=other-server-group, socket-binding-port-offset=550)"
sh jboss-cli.sh --connect "/host=master/server-config=server-4/:start(server=server-4,blocking=false)"
sh jboss-cli.sh --connect "/host=master/server-config=server-4:stop"
sh jboss-cli.sh --connect "/host=master/server-config=server-4/:remove"
```
 
 Setup Standalone with Domain on same Machine:

Domain mode has many profiles that used by each server, therefore it is easier to modify the Standalone configuration for startup:

first modify the standalone-ha.xml or standalone-full.xml, change the following ports:

<socket-binding name="management-native" interface="management" port="${jboss.management.native.port:19999}"/>

<socket-binding name="management-http" interface="management" port="${jboss.management.http.port:19990}"/>

<socket-binding name="management-https" interface="management" port="${jboss.management.https.port:19443}"/>

<socket-binding name="ajp" port="18009"/>

<socket-binding name="http" port="18080"/>

<socket-binding name="https" port="18443"/>

<socket-binding name="remoting" port="14447"/>

 
# Monitoring:

 

JMX Connection Port: <socket-binding name="management-native"

service:jmx:remoting-jmx://<hostname>:19999

Discovery non-SSL : <socket-binding name="management-http"

 

Generate Metrics:

Go to the Admin Console, port is in the configuration file's management-http/https port:

<socket-binding name="management-http" interface="management" port="${jboss.management.http.port:19990}"/>

<socket-binding name="management-https" interface="management" port="${jboss.management.https.port:19443}"/>

<host_name>:9990

 

1. Admin Console ===> Deployment ===> Add find your war and next

2. Assign to Server/server group then go to Server Group Tab at the top and enable the Applications.
 
 
 
 
 
 
 
 
