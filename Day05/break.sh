#!/bin/bash

for i in {1..10}
do
	if [ $i -eq 5 ]
	then
		echo "breaking the loop"
		break
	else
		echo $i
	fi
done

