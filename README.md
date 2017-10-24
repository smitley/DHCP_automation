# DHCP_automation
addHostForLeases.sh script finds hosts in the lease file and then creates static entries. 
#Please make sure to set all of your variables correctly.

#Set your lease file
leases=dhcpleases

#Set a place to set dhcp leases after they have been parsed 
dhcpparsed=dhcpparsed

#Set your dhcp.conf
dhcpconf=dhcp_conf

#Set your dhcp copy
dhcpcopy=dhcp_copy

#Set lock file variable
lf=/var/lock/addHostForLeases.lock


deleteHost.sh script used to delete host from dhcp.conf file

#Please make sure to set all of your variables correctly.

#DHCP conf file
dhcpconf=dhcp_conf_new

#DHCP copy file
dhcpcopy=dhcp_copy

