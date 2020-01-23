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

## To enable (remote) access the manager and host-manager page:
```
gedit $CATALINA_HOME/webapps/manager/META-INF/context.xml
```
```
gedit $CATALINA_HOME/webapps/host-manager/META-INF/context.xml
```
Comment the Valve for only internal access:

<Context antiResourceLocking="false" privileged="true" >
<!--<Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />-->
</Context>

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
