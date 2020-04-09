# JENKINS

## Unix-based
You installed Jenkins on a Debian-based or a Fedora-based distribution, you can use the following commands:
```
 sudo service jenkins restart
 sudo service jenkins stop
 sudo service jenkins start
```
Or in the latest distribution of Linux:
```
$ sudo systemctl start jenkins.service
$ sudo systemctl stop jenkins.service
$ sudo systemctl restart jenkins.service
```

* http://localhost:8080


# Remote access API
Jenkins provides machine-consumable remote access API to its functionalities. Currently it comes in three flavors:
1. XML
2. JSON with JSONP support
3. Python
Remote access API is offered in a REST-like style. That is, there is no single entry point for all features, and instead they are available under the ".../api/" URL where "..." portion is the data that it acts on.

For example, if your Jenkins installation sits at http://ci.jruby.org/, visiting http://ci.jruby.org/api/ will show just the top-level API features available – primarily a listing of the configured jobs for this Jenkins instance.
Or if you want to access information about a particular build, e.g. http://ci.jruby.org/job/jruby-base/lastSuccessfulBuild/, then go to http://ci.jruby.org/job/jruby-base/lastSuccessfulBuild/api/ and you'll see the list of functionalities for that build.
The work on this front is ongoing, so if you find missing features, please file an issue.

What can you do with it?
Remote API can be used to do things like these:
1. retrieve information from Jenkins for programmatic consumption.
2. trigger a new build
3. create/copy jobs

## Submitting jobs
Jobs without parameters
You merely need to perform an HTTP POST on JENKINS_URL/job/JOBNAME/build.
Jobs with parameters
Simple example - sending "String Parameters":

''' curl -X POST JENKINS_URL/job/JOB_NAME/buildWithParameters \
  --user USER:TOKEN \
  --data-urlencode json='{"parameter": [{"name":"id", "value":"123"}, {"name":"verbosity", "value":"high"}]}'
Another example - sending a "File Parameter":

curl -X POST JENKINS_URL/job/JOB_NAME/build \
  --user USER:PASSWORD \
  --form file0=@PATH_TO_FILE \
  --form json='{"parameter": [{"name":"FILE_LOCATION_AS_SET_IN_JENKINS", "file":"file0"}]}''''
 
E.g.curl -X POST http://JENKINS_URL/job/JOB_NAME/build  --form file0=@/home/user/Desktop/sample.xml --form json='{"parameter": [{"name":"harness/Task.xml", "file":"file0"}]}'
Please note, in this example, the symbol '@' is important to mention. Also, the path to the file is absolute path.
In order to make this command work, you need to configure your Jenkins job to take a file parameter and 'name' in this command corresponds to 'file location' field in the Jenkins job configuration.
 
In above example, 'harness' is just a name of folder that may not exist in your workspace, you can write "name":"Task.xml" and it will place the Task.xml at root of your workspace.
Remember that name in this command should match with File location in file parameter in job configuration.
