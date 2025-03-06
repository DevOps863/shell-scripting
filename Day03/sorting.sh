#!/bin/bash

echo "Enter the numbers with space:"
read -a numbers
for ((i = 0; i < ${#numbers[@]}; i++)); do
    for ((j = i + 1; j < ${#numbers[@]}; j++)); do
        if ((numbers[i] > numbers[j])); then
            temp=${numbers[i]}
            numbers[i]=${numbers[j]}
            numbers[j]=$temp
        fi
    done
done

echo "sorted numbers are : ${numbers[@]}"
 
