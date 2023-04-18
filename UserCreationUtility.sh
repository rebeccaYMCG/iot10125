#!/bin/bash 

clear

username=$(cat /home/rebeccamcglade/Names | tr 'A-Z'  'a-z')

password=$username@123

for user in $username
do
	adduser $user
       echo $password | passwd $user
done

echo "$(wc -l /home/rebeccamcglade/Names) users have been created" 
tail -n$(wc -l /home/rebeccamcglade/Names) /etc/passwd

