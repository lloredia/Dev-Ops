# MYSQL: DATABASE

## prerequisites
```
Oracle WebLogic Server 11g or 12c
ncurses-libs-5.9-13.20130511.el7
sudo yum install -y libaio
sudo yum install -y libaio-dev
sudo yum install -y libaio1
sudo yum install -y mariadb


```
## NEXT STEPS AFTER RUNNING THE INSTALLATION SCRIPT
After creating your new password

* RUN  ```[mysql57]$ mysql -u root -S run/mysqld.sock -p```  validate the new root password, at this point you will enter to mysql console where you can manage the database with SQL commands. Note that user precedes to “-u” and password precedes “-p” parameters.
                                        ```(for exit type Ctrl+C)```
                                   ```NOTE : all SQL command must end in ;```
* Inside MySQL console create the database and user schema with granting privileges. In our case will create a database: tutorial and user: appuser with same password.
```
MySQL [(none)]> CREATE DATABASE tutorial CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
MySQL [(none)]> CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'appuser';
MySQL [(none)]> GRANT SELECT, INSERT, DELETE ON tutorial.* TO 'appuser'@'localhost';
```

* Then you can access directly to database through mysql client. Note you will access the database tutorial (parameter “-D”) with  appuser (parameter “-u”).
```
[mysql57]$ mysql -uappuser -S run/mysqld.sock -D tutorial -pappuser
```

* Finally and once connected to tutorial database with appuser, you can see the grants assigned to that user.
```
MySQL [tutorial]> show grants;
+-----------------------------------------------------------------------+
| Grants for appuser@localhost                                          |
+-----------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'appuser'@'localhost'                           |
| GRANT SELECT, INSERT, DELETE ON `tutorial`.* TO 'appuser'@'localhost' |
+-----------------------------------------------------------------------+
2 rows in set (0.00 sec)
```

# Start Up & Shutdown Process

## START-UP
``` 
[mysql57]$ mysql -uappuser -S run/mysqld.sock -D tutorial -pappuser
```

## SHUTDOWN
```
[mysql57]$ ./bin/mysqladmin -u root -S run/mysqld.sock -psecret shutdown
```
