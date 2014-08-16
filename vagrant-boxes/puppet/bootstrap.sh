#!/bin/bash

## Bootstrap a development environment

if [ $UID != 0 ]; then
	echo -e "\nYou must run this script as root!\n"
	exit 1
fi

LOG_FILE=Puppet-Log_$(date '+%m-%d-%y_%H:%M:%S')

echo -e "Running puppet apply and logging output to /tmp/$LOG_FILE\n"
echo "Are you sure you want to run this script?: [Y/n]"; read answer

if [ $answer == "Y" ]; then
	echo "Running puppet stuff"
	puppet apply manifests/init.pp --modulepath modules/ | tee /tmp/$LOG_FILE
	
	user=$(users | awk '{print $1}')
	os_version=$(facter osfamily)
	if [ $os_version == "Debian" ]; then
		cp modules/development/files/bashrc-debian /home/$user/.bashrc
		su - $user -c "source /home/$user/.bashrc"
	elif [ $os_version == "RedHat" ]; then
		cp modules/development/files/bashrc-redhat /home/$user/.bashrc
		su - $user -c "source /home/$user/.bashrc"
	else
		echo -e "\nCould not set a bashrc for this operating system"
	fi

	echo -e "\nFinished. Please check the log file for any errors"
	exit 0
elif [ $answer == "n" ]; then
	echo "Aborting!"
	exit 0
else
	echo "Invalid option selected."
	exit 1
fi
