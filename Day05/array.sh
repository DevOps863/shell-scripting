#!/bin/bash

name="Bhargavaram"

echo ${#name}

for i in $(seq 0 ${#name})
do
	echo "${name:$i:2}"
done

