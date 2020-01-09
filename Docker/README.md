Creating your first Docker container
Docker creates virtual containers. Docker's container system is very efficient because it works with commits. This saves space, and allows you to see changes to the container. For example, if you install Apache in a container, you can create a commit with the name "Installed Apache" so you know exactly what happened.

The first thing we'll do is pull from a repository. Say that you want to install Ubuntu in a container, you can pull Ubuntu from the repository:

docker pull ubuntu
Be patient, as this can take a while. After everything has been downloaded, you can create a container with this OS:

docker run -i -t ubuntu /bin/bash
Or with Debian, for example:

docker run -i -t debian /bin/bash
If it can't find the OS (not pulled yet) it will automatically pull it from Docker Hub.
Effectively, you now have a container! You are running bash in the slimmed down container that is managed by Docker. Try running some common Linux commands to get a feel for the environment.

When you type exit to exit the container and return to your main OS, all of your changes will be gone. To save changes to a container, we use commits.
Commits

When you create a Docker container, its hostname is automatically generated. For example, when I create a new Ubuntu container, I might get the hostname f7943e42aff0. This is the name that Docker has given to your container.

Install what you want on it, and make sure everything works. Then exit your Docker container:
exit
We now need to commit; otherwise, all of your changes will be lost.

docker commit -a "William E." -m "Installed Apache" f7943e42aff0 apachesnapshot
The -a switch can be used to properly determine who authored that commit (who made the changes in the container). -m is the commit message. The f7943e42aff0 is the hostname of my container. In your case it will differ, as Docker generates them randomly. apachesnapshot is the name of your image.
You can view a list with all of the images on your local machine. The newest ones are at the top.
docker images

In order to start your Docker container with the changes, run:
docker run -t -i apachesnapshot /bin/bash
