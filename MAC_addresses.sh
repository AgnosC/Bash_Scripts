#!/bin/bash

# Get range
echo "Give the range to check (1-255 recommended):"
read -p "10.10.111." ipstart
read -p "10.10.111." ipend

# Populate ARP table
for (( i=$ipstart ; i<=$ipend ; i++ ))
do
	ping -c 1 10.10.111.$i > /dev/null 2>&1 &
done

#Allow pings to finish, while entertaining the user
echo "Let's allow the computer to do all those pings..."
x=5
while [[ x -gt 0 ]]
do 
	sleep 1
	echo "T-minus $x"
	let x=x-1
done

# Put ARP results into a file for parsing
arp -a | cut -d " " -f 4 > MAC_results.txt

# results.txt can get messy, so we display the results with a grep for lines with :
echo "Here are the MAC addresses I found in our network:"
grep ":" MAC_results.txt
