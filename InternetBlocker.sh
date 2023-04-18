#!/bin/bash

#IT group users
ITGroupUsers=(imeza amoore) 

#loop through the users in IT group
for user in "${ITGroupUsers}"
do
   #rule to allow incoming https packets
   sudo iptables -A OUTPUT -p tcp --dport 443 -m owner --uid-owner "$user" -j ACCEPT
done 

#exception for local web server
sudo iptables -A OUTPUT -p tcp --dport 443 -d 192.168.2.3 -j ACCEPT

#rule to drop all http and https traffic
sudo iptables -t filter -A OUTPUT -p tcp --dport 80 -j DROP
sudo iptables -t filter -A OUTPUT -p tcp --dport 443 -j DROP

#show message which shows number of people added
echo "Internet access granted for ${#ITGroupUsers} users in the IT department" 
