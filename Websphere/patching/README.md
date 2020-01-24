 WEBSPHERE - HOW TO INSTALL A WEBSPHERE FIX PACK


HOW TO INSTALL A FIX ON WEBSPHERE
Fix packs can only be installed using UpdateInstaller of IBM which can be downloaded separately
Install the Update Installer
e.g. /vol.rtk/install.techteam/aix/websphere/WAS_Update_7.0.0.13/
Put the file 7.0.0.7-WS-UPDI-LinuxIA32.zip inside the /tmp flder.
Extract the files: unzip 7.0.0.7-WS-UPDI-LinuxIA32.zip
Run the ./install shell.

* Accept the license:
* Make sure that it passes the system requirements:
* Uncheck the box for Create a start menu icon and select next:
* Verify the installation summary and select Next:
* The installation will start:
*Uncheck the box for Launch IBM Update Installer for WebSphere and select Finish:




## INSTALLING FIXPACK


Go to the directory when you have the FP and copy the fixpack or move it to the /opt/IBM/SIF/WebSphere/UpdateInstaller/maintenance folder
Go to the /opt/IBM/SIF/WebSphere/UpdateInstaller folder and start the update application:
./update.sh
Note: In case there is tempspace issue run updateinstaller as below:
./update.sh -D java.io.tmpdir "/old_home/admin/tmp"

* Select Next
* Verify that the WebSphere path is correct and select Next:
* Select Install maintenance package:
* Verify that the maintenance package directory is correct:
* Make sure that the FP box is selected
* Look at the Installation Summary and select next:
* Verify that the FP was applied successfully and select Finish:







