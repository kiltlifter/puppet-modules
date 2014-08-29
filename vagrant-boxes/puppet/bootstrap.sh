#!/bin/bash

########################################################
## Bootstrap a development environment
########################################################

## Prevent this script from being run as a non-root user
if [ $UID != 0 ]; then
	echo -e "\nYou must run this script as root!\n"
	exit 1
fi

## Find out where puppet resides
puppet_path=$(which puppet)
if [ $? == 1 ]; then
	echo -e "\nYou must have puppet installed for this to work!!!\n"
	echo -e "If you think puppet is installed, but not in your path try running:"
	echo -e "(RedHat)\n    export PATH=\$PATH:/usr/local/bin\n"
	echo -e "(Debian)\n    export PATH=\$PATH:/usr/bin\n"
	exit 1
fi

## Find out where facter resides
facter_path=$(which facter)
if [ $? == 1 ]; then
	echo -e "You must have facter installed for this to work!!!\n"
	exit 1
fi

## Create a log file that describes the action performed by the puppet commands
LOG_FILE=Puppet-Log_$(date '+%m-%d-%y_%H:%M:%S')

echo -e "Running puppet apply and logging output to /tmp/$LOG_FILE\n"
echo "Are you sure you want to run this script?: [Y/n]"; read answer

echo "Would you like to include java jdk 1.7?: [Y/n]"; read java_query
echo "Would you like to include sublime-text 2?: [Y/n]"; read sublime_query

## Determine if the user wants java
if [ $java_query == "Y" ]; then
	sed -i 's/.*development::java/  include development::java/g' modules/development/manifests/init.pp
else
	sed -i 's/.*development::java/  #include development::java/g' modules/development/manifests/init.pp
fi

## Determine if the user wants sublimetext
if [ $sublime_query == "Y" ]; then
	sed -i 's/.*editors::sublimetext/  include editors::sublimetext/g' modules/editors/manifests/init.pp
else
	sed -i 's/.*editors::sublimetext/  #include editors::sublimetext/g' modules/editors/manifests/init.pp
fi


if [ $answer == "Y" ]; then
	echo "Running puppet stuff"
	$puppet_path apply manifests/site.pp --modulepath modules/ | tee /tmp/$LOG_FILE

	echo "Would you like one of the included .bashrc files? [Y/n]: "; read bashrc-answer

	if [ "$bashrc-answer" == "Y" ]; then

		user=$(users | awk '{print $1}')
		os_version=$($facter_path osfamily)

		if [ "$os_version" == "Debian" ]; then
			cp modules/development/files/bashrc-debian /home/$user/.bashrc
			su - $user -c "source /home/$user/.bashrc"
			echo "Debian"
		elif [ "$os_version" == "RedHat" ]; then
			cp modules/development/files/bashrc-redhat /home/$user/.bashrc
			su - $user -c "source /home/$user/.bashrc"
			echo "RedHat"
		else
			echo -e "\nCould not set a bashrc for this operating system"
		fi

	else
		echo -e "\nFinished. Please check the log file for any errors"
		exit 0
	fi

elif [ $answer == "n" ]; then
	echo "Aborting!"
	exit 0
else
	echo "Invalid option selected."
	exit 1
fi
