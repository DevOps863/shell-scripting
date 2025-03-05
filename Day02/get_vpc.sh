#!/bin/bash

#check atleast one argument is provided or not

if [ $# -gt 0 ]; then
    REGIONS=$@
    echo "Fetching VPC ID's from $REGIONS"
    for REGION in $REGIONS; do
        aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r | tr '[:lower:]' '[:upper:]'
        # -r is used to remove the double quotes.
        # tr (trim) is used to convert the lower case letters to the upper case
    done
else
    echo " you have provided the $# arguments. please provide atleast one argument"
    exit 1
fi

