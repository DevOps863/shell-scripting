#!/bin/bash

fruits=("apple" "banana" "pinepapple" "orange")

echo "Length of the array is :${#fruits[@]}"

for i in $(seq 0 ${#fruits})
do
	echo ${fruits[i]}
done
