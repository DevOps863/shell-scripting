#Basic_argument passing
#!/bin/bash

echo " first argument :  $1"
echo " second argument :  $2"
echo " all arguments :  $@ "
echo " all arguments as single string : '$*' "
echo " Total number of arguments: $# "

$0 -- Name of the script.
$@ -- All the arguments passed to the script
$# -- Total number of arguments passed to the script.
$* -- Similar to the $@ but takes all the input as single word when quoted.
$$ -- current process id of the shell
$? -- exit status of the last command.
------------------------------------------------------------------------------------------
special_params.sh
-----------------
#!/bin/bash

echo "script name: $0"
echo "all arguments: $@"
echo " Total number of arguments : $# "
echo " process id of the shell : $$ "
echo " exit code of last executed command: $? "


-------------------------------------------------------------------------------------------
shell-script to retreive the VPC ID's from a specified aws region.

get_vpc.sh

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



-----------------------------------------------------------------

Error handling.sh
-----------------

To suppress the error, you need to redirect the output to /dev/null. It is file which discards every chnage 
whatever you are writing.

#!/bin/bash

aws --version > /dev/null 2>&1
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

Usage:
./error_handling.sh us-east-1 us-east-2
-----------------------------------------------------------------------------------------------


utilize exit codes to control the script flow

example.sh

#!/bin/bash
aws --version
if [ $? -eq 0 ]; then
    # proceed with the script
else
    echo "AWS cli not found! exiting!!!"
    exit 1
fi




