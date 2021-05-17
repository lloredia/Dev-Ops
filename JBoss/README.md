# JBOSS 


## JBOSS INSTALLATION 

```groupadd -g 1010 jboss
useradd -u 1010 -g jboss -s /sbin/nologin -m jboss

package_path=/root/install
mkdir -p ${package_path}
cd ${package_path}
```
```
mv /home/lloredia/EAP72JDK18 ${package_path}
chown -R root:root EAP72JDK18/
cd EAP72JDK18/
unzip jboss-eap-7.2.0.zip
```
```
cd ${package_path}/EAP72JDK18/
mv jboss-eap-7.2 /apps
```
```
cd ${package_path}/EAP72JDK18/
rpm -ivh jdk-8u231-linux-x64.rpm
which java;rpm -q --whatprovides java

#ls -lrt /etc/alternatives/java
chmod -R 755 /apps/jboss-eap-7.2/
chown -R jboss:jboss /apps /apps/logs /u01
chmod 755 ${package_path}

./standalone or ./domain 
```

## AFTER INSTALLATION 

```Standalone.xml
     --->  Update </interface>    #for connection purposes
	 
standalone.conf 
     ---> add JAVA_HOME="<PATH>"	#for jboss to constantly pick up your java home
```



## Creating Serviced for Jboss 

Create jboss.service under /etc/systemd/system 
[NOTE] : must be in root previllege 
```
cd /etc/systemd/system 
vi jboss.service 
```
(contents from jboss.service)
after inpt Run below commands:

```systemctl enable jboss```
```systemctl stop jboss```
```systemctl status jboss```
```systemctl start jboss```
