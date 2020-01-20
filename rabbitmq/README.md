# RabbitMQ

## Managing RabbitMQ

### Enabling the Management Console
RabbitMQ Management Console is one of the available plugins that lets you monitor the [RabbitMQ] server process through a web-based graphical user interface (GUI).

Using this console you can:

* Manage exchanges, queues, bindings, users
* Monitor queues, message rates, connections
* Send and receive messages
* Monitor Erlang processes, memory usage
And much more

### To enable RabbitMQ Management Console, run the following:
```
sudo rabbitmq-plugins enable rabbitmq_management

```
Once you’ve enabled the console, it can be accessed using your favourite web browser by visiting: 
```
http://[your droplet's IP]:15672/
```
he default username and password are both set ```“guest”``` for the log in.

To have RabbitMQ start as a daemon by default, run the following:

```
chkconfig rabbitmq-server on
```
To start, stop, restart and check the application status, use the following:

### To start the service:
```
/sbin/service rabbitmq-server start
```

### To stop the service:
```
/sbin/service rabbitmq-server stop
```

### To restart the service:
```
/sbin/service rabbitmq-server restart
```
### To check the status:
```
/sbin/service rabbitmq-server status
```
