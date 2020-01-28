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
   * Select the Installation Manager Directory to be installed. You can leave it to default /opt/IBM
   * Review the summary information and click on Install to begin installation
   * Click on Restart Installation Manager on completion wizard

Great, IBM Installation Manager 1.7 is installed now!
 
 
 
 ## Downloading IBM WAS 8.5.5 ND

 You can download WAS ND 8.5.5 Trial from the following link
 
[IBM WAS 8.5.5 ND](https://iwm.dhe.ibm.com/sdfdl/v2/regs2/duffys1/was855trials/nd_im/Xa.2/Xb.d9Tdgwrrmy0rKyzq4UFVZgksW2aApNe7a2d2c5ZwbCQ/Xc.nd_im/NDTRIAL.agent.installer.linux.gtk.x86_64.zip/Xd./Xf.LPr.D1vc/Xg.10561801/Xi.swerpws-wasndim85/XY.regsrvs/XZ.Pp_G63bdEWowuJU7jO_LxpqDfz0/NDTRIAL.agent.installer.linux.gtk.x86_64.zip)

After download, you should have  NDTRIAL.agent.installer.linux.gtk.x86_64.zip 
unzip :
```
unzip NDTRIAL.agent.installer.linux.gtk.x86_64.zip
```
Launch IBM Installation Manager if you have closed already. To launch you can go to and execute

/home/ec2-user/devops/dev_labs/websphere/app
```
./groupinst
```
   

    http://localhost:9060/ibm/console

    or

    https://localhost:9043/ibm/console
ex:
   ```
   https://3.20.57.181:9043/ibm/console/
   
   ```
   
   
   
   
   
  

## Using Jconsole:

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
