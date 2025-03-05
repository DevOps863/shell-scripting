#!/bin/bash

# To supress the aws cli version output and error if it fails
aws --version >/dev/null 2>&1
# check if previous command is successful.
# $? returns zero if the previous command is successful, if the previous command is unsuccessful it will
#  return other than zero.
if [ $? -eq 0 ]; then
    REGIONS=$@
    echo " Fetching VPC ID's from $REGIONS "
    for REGION in $REGIONS; do
        aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r | tr '[:lower:]' '[:upper:]'
    done
else
    echo "Incorrect aws command. Check the aws cli installation"
fi
 
