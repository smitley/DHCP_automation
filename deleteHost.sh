#!/bin/bash
####################################################
#title           :deleteHost.sh
#description     :This script is used to delete hosts from dhcp.conf
#author		 :Brandon Smitley
#date            :Last updated October 20, 2017
#version         :0.2    
####################################################
#Set lock file variable
lf=/var/lock/addHostForLeases.lock

#DHCP conf file
dhcpconf=dhcp_conf_new

#DHCP copy file
dhcpcopy=dhcp_copy


#check to see if the add script is running
if [ -f $lf ]; then 
	echo "The Add Host Leases script is still running. Please try again later"
	exit 0
fi

#Usage function
usage() { echo "Usage:
    deleteHost: $0
    deleteHost: $0 -f -h <hostname>
Options:
  -f	Force
  -h	Hostname"
	 exit 1; }


#Get Variables of the flags
while getopts "fh:" o; do
    case "${o}" in
        f)
            f="true"
            ;;
        h)
            h=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done


#If no flags are provided run the promot flag
if [ -z "${h}" ] && [ -z "${f}" ]; then	
	echo $h
	#Ask for the FQDN and recored it
	read -p "Enter the fqdn host you want to delete: " hostvar

	#Ask to be 100 percent and record it
	read -p "You are about to delete $hostvar. Are you sure? " -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
		then
			#Finds and the recored and removes it and places that output in a new file
			sed "/$hostvar {/,/^[[:space:]]*$/d" $dhcpconf > $dhcpcopy
			#Copies to the orginal file
		        $dhcpcopy > $dhcpconf
	        	rndc reload
	fi
fi

#Check for force flag and make sure a host name is attached
if  [ "${f}" == "true" ]; then
	if [ -z "${h}" ]; then
		echo "Please run the -h flag and provide the FQDN of the host you want to delete."
	else 	
		#Finds and the recored and removes it and places that output in a new file
		sed "/$h {/,/^[[:space:]]*$/d" $dhcpconf > $dhcpcopy
		#Copies to the orginal file
		cp -p $dhcpcopy $dhcpconf
		rndc reload
		
	fi
fi
