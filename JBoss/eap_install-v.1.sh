#!/usr/bin/env bash

######################################################################################################################
#
# name: eap_install.sh
# version: 1.0.1v
# dob: 12/20/2019
# explanation: Install script for JBoss EAP (+v) zip installation, this will aide in doing the manual steps.
# dependencies: Linux OS only & bash.
# modifications: 1.0.0v - (12/20/2019) - intial version.
#                1.0.1v - (12/26/2019) - syntax error for heredoc fixed!
#
# 
#
######################################################################################################################

######################################################################################################################
# Paths & Locations.
######################################################################################################################
eap_logs_directory=/apps/logs
eap_install_path=/apps
package_path=/root/install
log_directory=${package_path}/logs
scripts_directory=/script
next_steps_file=${package_path}/logs/next_steps.txt

# Authority
fid_group="jboss"
fid_name="jboss"

######################################################################################################################
# Functions.
######################################################################################################################
function Echo {
    echo "$(date +[%m/%d/%Y\ %H:%M:%S\ %Z])|$(hostname)|${@}" | tee -a ${log_directory}/eap_install.log
}

function return_check {
    input_return=${1}
    Message=${2}
    quit_flag=${3}
    if [[ ${input_return} -eq 0 ]]; then
        Echo "INFO| success -> ${Message}"
    else
        if [[ ${quit_flag} -eq 1 ]]; then
            Echo "ERROR| failed -> ${Message}"
            exit 1
        else
            Echo "WARN| not successful -> ${Message}"
        fi
    fi
}

function pre_check {
    if [[ "${USER}" == "root" ]]; then
        x=0
    else
        echo "ERROR| need super user previleges to run this script!"
        #return_check 1 "installing as ${USER}!" 1
        exit 1
    fi
    if [[ $(uname) == "Linux" ]]; then
        x=0
    else
        echo "ERROR| Linux only to run this script!"
        #return_check 1 "installing on $(uname)!" 1
        exit 1
    fi
}

function environment_check {
    if [[ -d ${package_path} ]]; then
        mkdir ${log_directory} >/dev/null 2>&1
        retVal=$?
        touch ${log_directory}/eap_install.log
        Echo "INFO| install path detected: '${package_path}'."
        return_check ${retVal} "creating '${log_directory}' directory." 0
        chmod 755 ${log_directory} ${package_path} >/dev/null 2>&1
    else
        #return_check 1 "missing ${package_path}!" 1
        echo "ERROR| missing '${package_path}'!"
        exit 1
    fi
    if [[ -d ${eap_install_path} ]]; then
        Echo "INFO| EAP path detected: '${eap_install_path}'."
    else
        return_check 1 "missing '${eap_install_path}'!" 1
    fi
    if [[ -d ${eap_logs_directory} ]]; then
        Echo "INFO| EAP logs path detected: '${eap_logs_directory}'."
    else
        return_check 1 "missing '${eap_logs_directory}'!" 1
    fi
    if [[ -d ${scripts_directory} ]]; then
        Echo "INFO| EAP scripts path detected: '${scripts_directory}'."
    else
        return_check 1 "missing '${scripts_directory}'!" 1
    fi
}

function create_authority {
    # to-do remove the gid and uid hardcoded numbers.
    groupadd -g 1010 ${fid_group} >/dev/null 2>&1
    return_check $? "creating functional id group '${fid_group}'." 1
    useradd -u 1010 -g ${fid_group} -s /sbin/nologin -m ${fid_name} >/dev/null 2>&1
    return_check $? "creating functional id '${fid_name}'." 1
}

######################################################################################################################
# Main.
######################################################################################################################
if [[ $# -eq 2 ]]; then
    pre_check
    environment_check
    create_authority
    zip_name=${1}
    rpm_file=${2}
    if [[ -f ${package_path}/${zip_name} ]]; then
       #cd ${eap_install_path}
       cd ${package_path}
       mkdir temp >/dev/null 2>&1
       return_check $? "creating '${package_path}/temp' directory." 0
       Echo "INFO| created 'temp' for inflating files..."
       cd ${package_path}/temp
       unzip -o ${package_path}/${zip_name} 2>${log_directory}/unzip.err 1>${log_directory}/unzip.out
       return_check $? "unzip '${package_path}/${zip_name}' under '${package_path}/temp'." 1
       installation_present=$(ls ${package_path}/temp)
       if [[ -d ${eap_install_path}/${installation_present} ]]; then
           Echo "ERROR| duplicate installation!, this version already exists under '${eap_install_path}'."
           return_check 1 " install '${zip_name}'." 1
       fi
       cd ${package_path}/temp
       mv ${installation_present} ${eap_install_path}/ >/dev/null 2>&1
       return_check $? "moved '${package_path}/temp/${installation_present}' to '${eap_install_path}'." 1
       chown -R ${fid_name}:${fid_group} ${scripts_directory} ${eap_logs_directory} ${eap_install_path} >/dev/null 2>&1
       return_check $? "ownership change to '${fid_name}'." 1
       chmod -R 755 ${scripts_directory} ${eap_logs_directory} ${eap_install_path} >/dev/null 2>&1
       return_check $? "permission change to 755." 1
       Echo "INFO| '${zip_name}', installed -> go to '${eap_install_path}'."
    else
       Echo "ERROR| '${package_path}/${zip_name}' not found!"
       return_check 1 "missing EAP install package." 1
    fi
    if [[ -f ${package_path}/${rpm_file} ]]; then
       rpm -ivh ${package_path}/${rpm_file} 2>${log_directory}/rpm.err 1>${log_directory}/rpm.out
       return_check $? "JDK '${package_path}/${rpm_file}'." 1
       Echo "INFO| $(rpm -q --whatprovides java), installed."
       jdk_java=$(ls -lrt /etc/alternatives/java | awk '{print $NF}')
       Echo "INFO| java=${jdk_java}."
    else
       Echo "ERROR| '${package_path}/${rpm_file}' not found!"
       return_check 1 "missing JDK RPM install package." 1
    fi
    ip_address=$(hostname -i)
    time_now=$(date +[%m/%d/%Y\ %H:%M:%S\ %Z])
    vm_name=$(hostname -f)
    cat <<EOF > ${next_steps_file}
-----------------------------------------------------------------------------------------------------------------------------------
  ${time_now} - ${vm_name}: Contact Shane Reddy (shane.reddy@ttiinc.com) for any concerns or questions.
    ${eap_logs_directory} -> EAP logs directory.
    ${eap_install_path} -> EAP install directory.
    ${package_path} -> Zip/ packages directory.
    ${package_path}/logs -> Logs directory for this tool.
    ${scripts_directory} -> EAP scripts directory.
    ${next_steps_file} -> Next steps file.
    ${fid_group} -> FID group membership.
    ${fid_name} -> EAP FID account.
-----------------------------------------------------------------------------------------------------------------------------------
    -> IP address for this host is ${ip_address}, this needs to be updated for all the XML files under 'configuration' directory.
    -> Applies to both standalone or domain installations, unless running a sandbox.
    -> Run the following command once inside the 'configuration' directory -----> sed -i "s/127.0.0.1/${ip_address}/g" *.xml <-----
    -> Use 'host-master.xml' for Domain Controller and 'host-slave.xml' for all Host Controllers.
    -> Use 'standalone.xml' for standalone installation.
    -> Update the 'name' inside "<host" tag inside your XML file, example: <host xmlns="urn:jboss:domain:8.0" -----> name="devmaster" <----- >
    -> Above 'name' identifies the 'host' inside the EAP installation.
    -> <Installpath>/domain/bin: [Master node only]
         Create the admin user in the master node [Capture the secret value]

         ''''''''

         <installed_path>/bin/add-user.sh

         ''''''''

    -> Update the secret value generated above in all the Slave nodes, also need to add admin user 'username' to 'domain-controller', see below:

        ''''''''

        <management>
        <security-realms>
            <security-realm name="ManagementRealm">
                <server-identities>
                    <secret value="<<<<>>>>"/> <-----
                </server-identities>
        .
        .
        .

        <domain-controller>
            <remote host=............... security-realm="ManagementRealm" -----> username="<<<<>>>>" <-----/>
        </domain-controller>

        ''''''''

    -> Make sure to add the public and unsecure interfaces for all the nodes including Master, see below:

        ''''''''

        <interfaces>
            <interface name="management">
                <inet-address value=".............."/>
            </interface>
            <interface name="public">
                <inet-address value="....jboss.bind.address:${ip_address}"/>
            </interface>
            <interface name="unsecure">
                <inet-address value="...jboss.bind.address.unsecure:${ip_address}"/>
            </interface>
        </interfaces>

       '''''''''

    -> Update the management port for all the Slave nodes, see below: The domain management port can be '9999'

        ''''''''

        <management-interfaces>
            <native-interface security-realm="ManagementRealm">
                <socket interface="management" port=".....:?????? <-----"/>
            </native-interface>
        </management-interfaces>

        ''''''''

    -> Navigate to 'bin' directory and depending on 'domain' or 'standalone' installation, update the JAVA_HOME & JAVA_OPTS variables inside the '.conf files.
        'domain.conf' or 'standalone.conf'

        ''''''''

        #
        # Specify the location of the Java home directory.  If set then $JAVA will
        # be defined to $JAVA_HOME/bin/java, else $JAVA will be "java".
        #
        JAVA_HOME=<<<<>>>>

        # Custom logging location
        JAVA_OPTS="$JAVA_OPTS -Djboss.server.log.dir=<<<>>>"

        ''''''''


    -> Make any application or environment specific settings, contact developer for any backend setup.

    -> Admin console should be accessible here: http://<domain controller host>:9990/console/index.html
    -> Use the admin username/ password combination to login. This will have SuperUser access control, Server Group, JVMs, Deployment etc can be created after this.
    -> Take a backup/ snapshot after this to preserve the installation.
    -> The Red Hat site where the zip package was downloaded should have the approprate patch softwares for your installation.
    -> Patch update can be performed from the admin console as SuperUser, please make sure you have taken the backup.

-----------------------------------------------------------------------------------------------------------------------------------
#_end
EOF
    echo "";echo ""
    Echo "INFO| your installation is completed!"
    Echo "INFO| please refer ${next_steps_file} for next steps/ tasks for completing the EAP install."
    echo "";echo ""
else
    echo "ERROR| usage error, provide the name of the package (zip file) & JDK RPM files to install."
    echo "INFO| files should be copied to the ${package_path}."
    exit 1
fi

#end_eap_install.sh
