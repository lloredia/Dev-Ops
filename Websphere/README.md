# Websphere Liberty 8.5.5 Install

Download:

https://developer.ibm.com/wasdev/downloads/#asset/runtimes-wlp-javaee7

unzip under scratch

 

https://connectopensource.atlassian.net/wiki/pages/viewpage.action?pageId=12681451

cd /scratch/wlp/bin

sh server create websphereserver1

sh server start websphereserver1

 

Enable Datasource

modify the server.xml under wlp/usr/servers/server1

    <library id="OracleLib">
        <fileset dir="/scratch" includes="ojdbc7.jar"/>
    </library>

    <dataSource jndiName="java:/oracle" transactional="false">
           <jdbcDriver libraryRef="OracleLib"/>
           <properties.oracle driverType="thin" URL="jdbc:oracle:thin:@slc03rvg.us.oracle.com:1521:orcl" user="sysman" password="welcome1"/>
    </dataSource>
    
    Websphere Full 8.5.5 install:
    https://youtu.be/gidA5Z2Vw3o 
    https://youtu.be/6kq5VyhjzYE
    
    First need to instann IBM Install manager,

Download from:

http://www-933.ibm.com/support/fixcentral/swg/selectFixes?parent=ibm~Rational&product=ibm/Rational/IBM+Installation+Manager&release=1.6.2.0&platform=All&function=all

then add the disk 1 repository file in the Websphere Full 8.5.5 install to it and then install.

https://www-01.ibm.com/marketing/iwm/iwm/web/download.do?source=swerpws-wasbase85-3&S_PKG=dl1&lang=en_US&dlmethod=http

Create user admin/admin

http://localhost:9060/ibm/console

 

Using Jconsole:

http://www.monitis.com/blog/2012/09/12/configuring-jmx-in-websphere-8-5

Create a script to tweat special jconsole run:

```
#!/bin/bash
 
WAS_HOME=/scratch/IBM/WebSphere/AppServer
 
# setup server-specific env variables
. $WAS_HOME/profiles/AppSrv01/bin/setupCmdLine.sh
 
#HOST=localhost
HOST=localhost # Change this as needed
PORT=9100
 
CLASSPATH=$JAVA_HOME/lib/jconsole.jar
CLASSPATH=$CLASSPATH:$WAS_HOME/runtimes/com.ibm.ws.admin.client_8.5.0.jar
CLASSPATH=$CLASSPATH:$WAS_HOME/runtimes/com.ibm.ws.ejb.thinclient_8.5.0.jar
CLASSPATH=$CLASSPATH:$WAS_HOME/runtimes/com.ibm.ws.orb_8.5.0.jar
 
$JAVA_HOME/bin/jconsole \
        -J-Djava.class.path=$CLASSPATH\
        -J$CLIENTSAS\
        -J$CLIENTSSL\
        service:jmx:iiop://$HOST:$PORT/jndi/JMXConnector
```
