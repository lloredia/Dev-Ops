# Create a Dockerfile
### Prerequisites
* dcoker
* apt-get install -y gnupg
* apt-get install -y gnupg2
* apt-get install -y gnupg1


## Getting Started
You can start creating your Dockerfile in the text editor of your choice, so open a new file and begin by specifying a base image. To do this, use the FROM keyword followed by our chosen base image:
```
FROM ubuntu
````
If you try to pull an image without providing a version number, the client will default to the latest one. Next, you must declare the maintainer, or author, of the Dockerfile:
```
MAINTAINER Darth Vader
```
After that, it’s a good idea to update the application repository list. This step is not always necessary, but you should make it a habit while you’re learning:
```
RUN apt-get update
```
Next, you will set the arguments and commands for downloading MongoDB. You can check the MongoDB docs for a full explanation of the installation process, but the code is pretty straightforward. First, add the package verification key:
```
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
```
Then, add MongoDB to the repository sources list:
```
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
```
Update the repository sources list one more time:
```
RUN apt-get update
```
Install the MongoDB package and create the default data directory:\
```
RUN apt-get install -y mongodb-10gen
RUN mkdir -p /data/db
```
The next step is setting the default port for MongoDB:
```
EXPOSE 27017
CMD ["--port 27017"]
```
Finally, set a default container command:
```
ENTRYPOINT usr/bin/mongod
```
You can now save the file. Excluding any documentation, your Dockerfile should look as follows:
```
FROM ubuntu
MAINTAINER Darth Vader
RUN apt-get update
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install -y mongodb-10gen
RUN mkdir -p /data/db
EXPOSE 27017
CMD ["--port 27017"]
ENTRYPOINT usr/bin/mongod
```
#  Build an Image

Now that you’ve got the hard part out of the way, you can create an image by typing the following into the Docker command line:
```
docker build -t my_mongodb .
```
The -t flag tags the image. You can see all of your options for images by running:
```
docker build --help
```
## Running MongoDB

Finally, we can create a container that runs an instance of MongoDB in Ubuntu. Be sure to give it a name, or else Docker will assign a random alphanumeric ID:
sudo docker run -name my_first_mdb_instance -i -t my_mongodb
The application should now function perfectly on any computer. To see all of your Docker IDs, get a list by running the following code:
sudo docker ps -l
