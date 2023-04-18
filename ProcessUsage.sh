#!/bin/bash

clear

#to get the date
currentDate=$(date +"%F") 

#creating a log file
logCurrent="ProccessUsageReport-<$currentDate>.txt"

#getting the cpu usage
cpuUsage=$(ps aux --sort -%cpu | head -6) 
echo "CPU Usage: "
echo "$cpuUsage"

#var which includes the processes killed / log needs to be fixed 
executedProcessesLog=$(cat /var/log/kern.log | grep -i $currentDate)  

#to identify how many process were closed
closed=$(ps aux --no-heading | wc -l)

#kill confirmation
read -p "Would you like to kill these proccesses? [y/n]" yn

#case to kill the processes
case $yn in
#user awnsers yes
[yY])	echo "Processes being killed..."
	echo `ps -o user,start,%cpu`>> $logCurrent
	echo $executedProcessesLog >> $logCurrent
	sleep 10
	#message for how many processes were killed
	echo "Now closing out of $closed processes..." 
	sleep 10
	#kills everything, tried to make a trap for sigterm but couldnt figure it out
	`kill -15 -1`
	exit;;
#user awnsers no
[nN])	echo "Exiting..."
	exit;;
#defult if anything else is inputted
*)	echo "Invalid response, please try again..."
esac


