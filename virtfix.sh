#!/usr/bin/env bash
if [ $EUID -ne 0 ] ; then
    clear
    echo "virtfix must be run as root, play it again Sam";
    sleep 2
    exit 1
fi
sleep 1
if [ ! -f "/usr/bin/virtualbox" ];
then
	sleep 1
	echo "No VirtualBox Installation Present"
	sleep 1
	echo "exiting..."
	exit 0
fi

echo "Fixing VirtualBox"
sleep 2
sudo apt install --reinstall virtualbox-dkms &> /dev/null
sudo modprobe vboxdrv
read -rp "Do you want to run virtualbox? [(y)es]/[(n)o]" 
echo  
if [[ $REPLY =~ ^[Yy]$ ]]
	then
    		virtualbox & 
		exit 0;
fi

if [[ $REPLY =~ ^[Nn]$ ]]
	then
	    	exit 0;
fi

