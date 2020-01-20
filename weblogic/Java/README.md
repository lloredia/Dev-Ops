# [JAVA](https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8u211-later-5573849.html)

## INSTALLATION 

* Run [Java8.sh](https://github.com/lloredia/Path-to-Devops/blob/master/weblogic/Java/java8.sh) - and it should download jdk-8u221-linux-x64.tar.gz

* Next Untar the file 
```  tar -zxvf jdk-8u221-linux-x64.tar.gz```


* Set env variables 
```
jdk1.8.0_221]$  JAVA_HOME=/home/ec2-user/soft/tutorial/jdk1.8.0_221/
```
```
bin]$ export PATH=$JAVA_HOME/bin:$PATH
```

* Verify with this command 
```
   java -version 
```
