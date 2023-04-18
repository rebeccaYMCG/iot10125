#!/bin/bash 

#test to see if /EmployeeData exists- makes it if it doesnt
if 
[ ! -d "/EmployeeData" ]; then 
   mkdir /EmployeeData 
fi 

#hr folder with special access -> rwx-rw----
mkdir /EmployeeData/HR
chmod 760 /EmployeeData/HR
chown :HR /EmployeeData/HR

#it folder with the normal access -> rwx-rw-r--
mkdir /EmployeeData/IT
chmod 764 /EmployeeData/IT
chown :IT /EmployeeData/IT

#finance folder with the normal access -> rwx-rw-r--
mkdir /EmployeeData/Finance
chmod 764 /EmployeeData/Finance
chown :Finance /EmployeeData/Finance

#executive folder with special access -> rwx-rw----
mkdir /EmployeeData/Executive
chmod 760 /EmployeeData/HR
chown :Executive /EmployeeData/Executive

#administrative folder with normal access -> rwx-rw-r--
mkdir /EmployeeData/Administrative
chmod 764 /EmployeeData/Administrative
chown :Administrative /EmployeeData/Administrative

#call centre folder with normal access -> rwx-rw-r--
mkdir /EmployeeData/CallCentre
chmod 764 /EmployeeData/CallCentre
chown :CallCentre /EmployeeData/CallCentre

#variable for how many folders were added 
foldersAddedCount=$(ls -d /EmployeeData/*/ | wc -l)

#display the message to show how many folders were added
echo "Folders created: $foldersAddedCount" 
