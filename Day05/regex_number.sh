#!/bin/bash

echo "Enter the phone numbers with space:"

read -a input

echo "No of phone numbers are ${#input[@]}"

for phone in ${input[@]}
do
	if [[ $phone  =~ ^1-234-[0-9]{6}$ ]]
	then
		echo "Entered number is correct"
	else
		echo "Entered number is incorrect"
	fi
done

