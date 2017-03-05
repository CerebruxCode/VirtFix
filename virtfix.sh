#!/usr/bin/env bash
if [ $EUID -ne 0 ] ; then
    clear
    echo ""
    echo "virtfix must be run as root, play it again Sam" 1>&2
    echo ""
    sleep 2
    exit 1
fi

sleep 5 

echo "Fixing VirtualBox"
sleep 2
sudo apt install --reinstall virtualbox-dkms
sudo modprobe vboxdrv

read -p "Do you want to run virtualbox? [(y)es]/[(n)o]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
	then
    		virtualbox &
		exit
fi

if [[ $REPLY =~ ^[Nn]$ ]]
	then
	    	exit
fi

