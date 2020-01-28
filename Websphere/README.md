# Websphere Liberty 8.5.5 Install

## Downloading IBM Installation Manager

You can download latest IBM Installation Manager 1.7 from the following link

[IBM Installation Manager ](http://www.ibm.com/support/fixcentral/swg/quickorder?parent=ibm/Rational&product=ibm/Rational/IBM+Installation+Manager&release=1.7.0.0&platform=All&function=fixId&fixids=1.7.0.0-Rational-IBMIM-LINUX-X86_64-20130828_2012&useReleaseAsTarget=true)
After download, you should have agent.installer.linux.gtk.x86_64_1.7.0.20130828_2012.zip

* Extract the downloaded file using unzip command
```
 unzip agent.installer.linux.gtk.x86_64_1.7.0.20130828_2012.zip
 ```
 
   * Execute ./install to start installation
   * Click on Next
   * Select the license agreement and click Next
   * Select the Installation Manager Directory to be installed. You can leave it to default if you wish to install under /opt/IBM
   * Review the summary information and click on Install to begin installation
   * Click on Restart Installation Manager on completion wizard

Great, IBM Installation Manager 1.7 is installed now!
 
 
 
 
 ## Downloading IBM WAS 8.5.5 ND

 You can download WAS ND 8.5.5 Trial from the following link
 
[IBM WAS 8.5.5 ND](https://iwm.dhe.ibm.com/sdfdl/v2/regs2/duffys1/was855trials/nd_im/Xa.2/Xb.d9Tdgwrrmy0rKyzq4UFVZgksW2aApNe7a2d2c5ZwbCQ/Xc.nd_im/NDTRIAL.agent.installer.linux.gtk.x86_64.zip/Xd./Xf.LPr.D1vc/Xg.10561801/Xi.swerpws-wasndim85/XY.regsrvs/XZ.Pp_G63bdEWowuJU7jO_LxpqDfz0/NDTRIAL.agent.installer.linux.gtk.x86_64.zip)


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
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
