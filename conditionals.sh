#!/bin/bash

# [[ "STRING1" == "STRING2" ]] --> True if strings are the same
# [[ "STRING1" != "STRING2" ]] --> True if strings are NOT the same
#
# [[NUM1 -eq NUM2 ]] --> True if numbers are equal
# [[NUM1 -ne NUM2 }} --> True if numbers are NOT equal
# [[NUM1 -lt NUM2 ]] --> True if NUM1 is less than NUM2
# [[NUM1 -gt NUM2 ]] --> True if NUM1 is greater than NUM2
# [[NUM1 -ge NUM2 ]] --> True if NUM1 is greater than or equal to NUM2
#
# [[ THING =~ 'REGEX ]] --> True if THING matches the REGEX provided

integertest='^[0-9]+$'

if [[ $1 =~ $integertest ]] && [[ $2 =~ $integertest ]]; then
	if [[ $1 -gt $2 ]]; then
		echo "$1 is greater than $2"
	elif [[ $1 -lt $2 ]]; then
		echo "$1 is less than $2"
	else
		echo "$1 is equal to $2"
	fi
else
	echo "Those aren't numbers, you fuck.  Enter numbers as arguments next time..."
fi

