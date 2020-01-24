UI/WS/SB Servers:

su - oci_fmw
cd /u01
mv /u01/jdk /u01/jdk1.8.0_221
tar -xvf /u05/CPU/OCT2019/OC/jdk-8u231-linux-x64.tar.gz
mv jdk1.8.0_231 jdk
mv jdk/jre/lib/security/cacerts jdk/jre/lib/security/cacerts.orig
cp -rp jdk1.8.0_221/jre/lib/security/cacerts jdk/jre/lib/security/

export ORACLE_HOME=/u01/app/oracle/middleware/Oracle12213_Home
export PATH=$ORACLE_HOME/OPatch:$PATH
opatch lsinventory

mkdir /u01/PATCH_TOP
cd /u01/PATCH_TOP
unzip /u05/CPU/OCT2019/OC/p29909359_139400_Generic.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/29909359

unzip /u05/CPU/OCT2019/OC/p30386660_122130_Generic.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/30386660
sqlplus <dba-connect-info> cleanup.sql  UI_WLS  UI_WLS_RUNTIME

unzip /u05/CPU/OCT2019/OC/p30347629_122130_Generic.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/30347629

Make sure below pages are applied.

opatch lsinventory| grep 29650702
opatch lsinventory| grep 29680122
opatch lsinventory| grep 29825297

opatch napply PATCH_TOP -silent ==> patch all in 

Only for OSB apply below CPU patch also.

unzip /u05/CPU/OCT2019/OC/p30059259_122130_Generic.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/30059259

==========================================================================================
OHS:

su - oci_fmw
cd /u01
mv /u01/jdk /u01/jdk1.8.0_221
tar -xvf /u05/CPU/OCT2019/OC/jdk-8u231-linux-x64.tar.gz
mv jdk1.8.0_231 jdk
mv jdk/jre/lib/security/cacerts jdk/jre/lib/security/cacerts.orig
cp -rp jdk1.8.0_221/jre/lib/security/cacerts jdk/jre/lib/security/

export ORACLE_HOME=/u01/app/oracle/middleware12213_Home
export PATH=$ORACLE_HOME/OPatch:$PATH
opatch lsinventory


mkdir /u01/PATCH_TOP
cd /u01/PATCH_TOP

opatch version
unzip /u05/CPU/OCT2019/OC/p28186730_139400_Generic.zip
java -jar /u01/PATCH_TOP/6880880/opatch_generic.jar -silent oracle_home=/u01/app/oracle/middleware12213_Home -invPtrLoc /u01/oraInventory/oraInst.loc

unzip /u05/CPU/OCT2019/OC/p29909359_139400_Generic.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/29909359

unzip /u05/CPU/OCT2019/OC/p30386660_122130_Generic.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/30386660                           opatch lsinventory| grep 30386660                opatch lsinventory| grep 29650702

chown oci_fmw:oci_apps /u01/app/oracle/middleware12213/ohs/bin/launch

unzip /u05/CPU/OCT2019/OC/p30158713_122130_Linux-x86-64.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/30158713

unzip /u05/CPU/OCT2019/OC/p29321695_122130_Linux-x86-64.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/29321695

unzip /u05/CPU/OCT2019/OC/p29650702_122130_Generic.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/29650702

unzip /u05/CPU/OCT2019/OC/p27323998_122130_Linux-x86-64.zip
opatch apply -silent -jre /u01/jdk/jre /u01/PATCH_TOP/27323998

chown root /u01/app/oracle/middleware12213/ohs/bin/launch
chmod 4750 /u01/app/oracle/middleware12213/ohs/bin/launch

To fix OHS startup issue if any, please follow MOS Note 2550734.1.
<IfModule !mpm_winnt_module>
          Mutex pthread ssl-cache
          User oci_fmw
          Group oci_apps
</IfModule>
Make sure changes are present in both staging and run-time directory for ssl.conf --->> /u01/app/oracle/middleware/user_projects/domains/ohs_domain/config/fmwconfig/components/OHS
Staging directory:
DOMAIN_HOME/config/fmwconfig/components/OHS/componentName
Run-time directory:
DOMAIN_HOME/config/fmwconfig/components/OHS/instances/componentName


# OPATCH UPGRADE 

PATCH 28186730 - OPATCH 13.9.4.2.1 FOR FMW/WLS 12.2.1.3.0
		
Platform             : Generic
Product Patched      : Oracle Fusion Middleware 12c / Oracle WebLogic Server 12c
Product Version      : 12.2.1.3.0



Pre-Installation Instructions 
----------------------------- 

1. Backup your <ORACLE_HOME>
 
2. Unzip this patch into your PATCH_HOME staging directory. 

3. This installer must be executed using a Java Development Kit (JDK). 
   - Set your PATH to include your <JDK_LOCATION>/bin


Installation
----------------------------------
 
 Install the software with the following command:
```
    UNIX Only:
	java -jar <PATCH_HOME>/6880880/opatch_generic.jar -silent oracle_home=<ORACLE_HOME_LOCATION>
```
Note: If you have /tmp is set with a noexec flag, you can override the tmp with the -D argument:
	java opatch_generic.jar -Djava.io.tmpdir=/opt/oracle -jar -silent oracle_home=<ORACLE_HOME_LOCATION>
	
	Windows Only:
	java -jar opatch_generic.jar -J-Doracle.installer.oh_admin_acl=true -silent oracle_home=<ORACLE_HOME_LOCATION>


where ORACLE_HOME_LOCATION is the absolute path where you have installed FMW/WLS products.

If using a custom Inventory location, install the software with the following command:
    
    java -jar <PATCH_HOME>/6880880/opatch_generic.jar -silent oracle_home=<ORACLE_HOME_LOCATION> -invPtrLoc <INVENTORY_LOCATION>

where INVENTORY_LOCATION is the absolute path to the oraInst.loc file.



2. To validate the installation:

    cd <ORACLE_HOME>/OPatch
    opatch version
    opatch lspatches
 
 
Post-installation Instructions
----------------------------------

When applying interim patches with OPatch 13.9.4, Microsoft Windows platform needs the '-oop' option:

<ORACLE_HOME>/OPatch/opatch apply <PATCH_HOME> -oop

where PATCH_HOME is a numbered directory where you extracted interim patch contents.

Follow interim patch readmes for other installation steps to apply patches.

 
Deinstallation
--------------

There is no mechanism to revert OPatch to an older version.

To revert OPatch, restore the backup for your ORACLE_HOME

 
Documentation and Help
-----------------------

To obtain command names or options from the command prompt, use:

    opatch -help
    opatch napply -help
