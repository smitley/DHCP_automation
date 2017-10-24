# DHCP_automation

addHostForLeases.sh script finds hosts in the lease file and then creates static entries. 

#Please make sure to set all of your variables correctly.

Set your lease file

leases=variable

Set a place to set dhcp leases after they have been parsed 

dhcpparsed=variable

Set your dhcp.conf

dhcpconf=variable

Set your dhcp copy

dhcpcopy=variable

Set lock file variable

lf=variable


deleteHost.sh script used to delete host from dhcp.conf file

#Please make sure to set all of your variables correctly.

DHCP conf file

dhcpconf=variable

DHCP copy file

dhcpcopy=variable

