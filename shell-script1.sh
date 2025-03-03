#!/bin/bash
# To run the script in the debug mode use set -x
set -x
x=10
double_quote="Bhargav-$x"
single_quote='Bhargav-$x'
# understand the difference between the double quote and single, if you read the variable in double quote it will print the variable value
# if you read the varibale in single quote it will 
echo "Printing double quote value $double_quote"
echo "Printing single quote value $single_quote"
for i in {1..10}
do
 echo $(date) 
 sleep 1
done

echo "############################"
 #Demo for using awk,  awk command's main purpose is to make information retrieval and text manipulation easy to perform in Linux.
echo "### Demo for awk command ###"
echo $(date) | awk -F " " '{print $1,$2,$3,$4}'
# Demo for cut command, cut command is used to extract sections from each line of input data.
echo "### cut command demo ###"
echo $(date) | cut -d " " -f 1,2,3,4

# The awk command can be used for more complex field manipulation

echo "### Difference between awk and cut when you try to print in reverse order ###"
echo "**** manipulation using cut command ****" 
echo $(date) | cut -d " " -f 4,3,2,1
echo "**** manipulation using awk command ****"
echo $(date) | awk -F " " '{print $4,$3,$2,$1}'

# grep command is used to find the specific patterns

cat grep.txt | grep -i www. # i refers to the ignore case

echo "#######################################"

cat grep.txt | grep -E www- # -E used for advanced pattern matching. 






