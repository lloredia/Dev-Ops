# TOMCAT 
            ===================================================
            Running The Apache Tomcat 9.0 Servlet/JSP Container
            ===================================================

Apache Tomcat 9.0 requires a Java Standard Edition Runtime
Environment (JRE) version 8 or later.

## Running With JRE 8 Or Later
(1) Download and Install a Java SE Runtime Environment (JRE)

http://jre.us.oracle.com/java/re/jdk/8u91/promoted/all/RE/latest/bundles/linux-x64/

(2) Download and Install Apache Tomcat

(2.1) Download a binary distribution of Tomcat from:

      https://tomcat.apache.org/

## Download Tomcat 9:

http://apache.spinellicreations.com/tomcat/tomcat-9/v9.0.30/bin/

Setting the environment variables:

```
JAVA_HOME=/home/ec2-user/soft/tutorial/jdk1.8.0_231
export PATH=$JAVA_HOME=/bin:$PATH
CATALINA_BASE=/home/ec2-user/devops/dev_labs/Tomcat/apache-tomcat-9.0.30/
CATALINA_HOME=/home/ec2-user/devops/dev_labs/Tomcat/apache-tomcat-9.0.30/

```
Start the Instance:

$CATALINA_HOME/bin/startup.sh

Check if the Instance process started:

ps auxww | grep tomcat



# Advanced Configuration - Multiple Tomcat Instances

```
 * bin  - Only the following files:

           * setenv.sh (*nix) or setenv.bat (Windows),
           * tomcat-juli.jar

          The setenv scripts were described above. The tomcat-juli library
          is documented in the Logging chapter in the User Guide.

 * conf - Server configuration files (including server.xml)

 * lib  - Libraries and classes, as explained below

 * logs - Log and output files

 * webapps - Automatically loaded web applications

 * work - Temporary working directories for web applications

 * temp - Directory used by the JVM for temporary files (java.io.tmpdir)


In CATALINA_HOME:

 * bin  - Startup and shutdown scripts

          The following files will be used only if they are absent in
          CATALINA_BASE/bin:

          setenv.sh (*nix), setenv.bat (Windows), tomcat-juli.jar

 * lib  - Libraries and classes, as explained below

 * endorsed - Libraries that override standard "Endorsed Standards"
              libraries provided by JRE. See Classloading documentation
              in the User Guide for details.
              This is only supported for Java <= 8.
              By default this "endorsed" directory is absent.
```







# To enable (remote) access the manager and host-manager page:
```
vim $CATALINA_HOME/webapps/manager/META-INF/context.xml
```
```
vim $CATALINA_HOME/webapps/host-manager/META-INF/context.xml
```
Comment the Valve for only internal access:
```
<Context antiResourceLocking="false" privileged="true" >
<Valve className="org.apache.catalina.valves.RemoteAddrValve" 
allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
< /Context >
```
```
gedit $CATALINA_HOME/conf/tomcat-users.xml
```

### tomcat-users.xml 

```
<tomcat-users>
   <role rolename="manager-gui"/>
   <role rolename="manager-script"/>
   <role rolename="manager-jmx"/>
   <role rolename="manager-status"/>
   <role rolename="admin-gui"/>
   <role rolename="admin-script"/>
   <user username="admin" password="admin" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-gui,admin-script"/>
</tomcat-users>
```

### Bouce the Tomcat instance:

$CATALINA_HOME/bin/shutdown.sh ; $CATALINA_HOME/bin/startup.sh

### Check the Tomcat HTML Web manager GUI:

 < Tomcat Instance Host Name >:8080

Click on Manager/Host-Manager (Username/Password:admin/admin)






# Enable SSL for HTTP:

Reference:

http://www.ibm.com/support/knowledgecenter/SSR27Q_5.0.2/com.ibm.jazz.repository.web.admin.doc/topics/t_server_mon_tomcat_option3.html

https://www.lullabot.com/articles/monitor-java-with-jmx

If using the default keystore path(/home/$username/.keystore):
```
$JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA
```
If specified:
```
$JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA -validity 365 -keystore tomcat.keystore -storepass storepass -keypass keypass
```
Modify server.xml to enable HTTPs connector
```
gedit $CATALINA_HOME/conf/server.xml
```

### server.xml  
```
If default keystore path:
 
<Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
           maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
           clientAuth="false" sslProtocol="TLS"
           keystoreFile="/home/whau/.keystore"
           keystorePass="welcome1" />
 
or specified:
 
<Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
           maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
           clientAuth="false" sslProtocol="TLS"
           keystoreFile="/scratch/apache-tomcat-9.0.0.M8/tomcat.keystore"
           keystorePass="storepass" />
```

### Bounce the Tomcat:
```
sh $CATALINA_HOME/bin/shutdown.sh

sh $CATALINA_HOME/bin/startup.sh
```
Check the Tomcat HTML Web manager GUI using the SSL port:

https://<Tomcat Instance Host Name>:8443
Enable JMX:
Modify JMX Environment Variable Settings:

```vim $CATALINA_HOME/bin/setenv.sh```

For Cred-less (Non-SSL): Add:
```
CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"```

For with-Credential (Non-SSL):  Add:
```
CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.password.file=../conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=../conf/jmxremote.access"```

For with-Credential (With-SSL):  Add:

If using the default keystore path(/home/$username/.keystore):

 
```
CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.ssl=true -Dcom.sun.management.jmxremote.authenticate=true -Djavax.net.ssl.keyStore=/home/whau/.keystore -Djavax.net.ssl.keyStorePassword=welcome1 -Dcom.sun.management.jmxremote.password.file=../conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=../conf/jmxremote.access -Dcom.sun.management.jmxremote.ssl.need.client.auth=false"
```
If specified:
```
CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.ssl=true -Dcom.sun.management.jmxremote.authenticate=true -Djavax.net.ssl.keyStore=/scratch/apache-tomcat-9.0.0.M8/tomcat.keystore -Djavax.net.ssl.keyStorePassword=storepass -Dcom.sun.management.jmxremote.password.file=/scratch/apache-tomcat-9.0.0.M8/conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=/scratch/apache-tomcat-9.0.0.M8/conf/jmxremote.access -Dcom.sun.management.jmxremote.ssl.need.client.auth=false"
```
Change the file permission as executable:

chmod 755 setenv.sh
If (Need JMX Credential):

```vim $CATALINA_HOME/conf/jmxremote.password Add:```

controlUser welcome1

adminUser welcome1


```vim $CATALINA_HOME/conf/jmxremote.access Add:```

 controlUser readonly

adminUser readwrite

Change the file permission for only the owner:

chmod 600 jmxremote.access

chmod 600 jmxremote.password

### Bounce the Tomcat:
```
sh $CATALINA_HOME/bin/shutdown.sh ; sh $CATALINA_HOME/bin/startup.sh

Check if Tomcat 9999 port is enabled and running

netstat -plten | grep java | grep 9999
```
Check if the JMX is really working by JConsole:

For Cred-less (Non-SSL):

jconsole

For with-Credential (Non-SSL): 

jconsole

For with-Credential (With-SSL): 

 

```
$JAVA_HOME/bin/keytool -export -alias tomcat -keystore tomcat.keystore -file tomcatkey.cer -storepass storepass

$JAVA_HOME/bin/keytool -import -alias tomcatkey -file tomcatkey.cer -keystore jconsole.truststore -storepass storepass -noprompt

jconsole -J-Djavax.net.ssl.trustStore=jconsole.truststore -J-Djavax.net.ssl.trustStorePassword=storepass
```
 

Some Useful Keytool Commands:

 

If wrong delete by:

 
```
$JAVA_HOME/bin/keytool -delete -alias tomcat
```
 

If change default keystore to custom path:

 
```
$JAVA_HOME/bin/keytool -genkey -alias tomcat9TestInstance -keyalg RSA -keystore /path/to/my/keystore
```
 

For test purpose, my testing password is: welcome1 (key and keystore)

 

If want to check the keystore:

 
```
$JAVA_HOME/bin/keytool -list -keystore /home/whau/.keystore
```
Datasource:

https://tomcat.apache.org/tomcat-9.0-doc/jndi-datasource-examples-howto.html


Add ODBC driver and UCP driver into $CATALINA_HOME/lib/



Add the following into $CATALINA_HOME/conf/context.xml
```
    <Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=slc09rzu.us.oracle.com)(PORT=1521)))(CONNECT_DATA=(SID=orcl12c)))"
              username="system" password="welcome1" maxActive="20" maxIdle="10"
              maxWait="-1"/>
```
