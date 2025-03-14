#!/bin/bash

for i in {1..10}
do
	if [ $i -eq 5 ]
	then
		echo "skipping the current iteration"
		continue
	else
		echo $i
	fi
done

