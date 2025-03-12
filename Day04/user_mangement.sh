#!/bin/bash
<<comment
if [ $# -gt 0 ]; then

    USER=$1
    echo $USER
    EXISTING_USER=$(cat /etc/passwd | grep -i $USER | cut -d ":" -f1)

    if [ "${USER}" = "${EXISTING_USER}" ]; then
        echo "This user is already present on the server. Try to create another user."
    else
        echo " Let's add the user"
        useradd -m $USER --shell /bin/bash
    fi
else
    echo " Please enter the valid user"
fi

comment

#Now add more functionality to create password to the user.

if [ $# -gt 0 ]; then

    USER=$1
    echo $USER
    EXISTING_USER=$(cat /etc/passwd | grep -i $USER | cut -d ":" -f1)

    if [ "${USER}" = "${EXISTING_USER}" ]; then
        echo "This user is already present on the server. Try to create another user."
    else
        echo " Let's add the user"
        useradd -m $USER --shell /bin/bash
        SPEC=$(echo '!@#$%^&-)' | fold -w1 | head -1) # select one special character randomly
        # fold is used to split the string into the individual character
        # -w1 is used to split only character for one line. If you want more you can use like -w2,-w3..
        # head -1 to take the first line of the output.
        PASSWORD="Indianarmy${SPEC}${RANDOM}"
        # It will create a password value and assign it to the Password variable
        # RANDOM is a built-in shell variable that generates a random number between
        # 0 and 32767 each time it is called.
        echo "$USER:$PASSWORD" | chpasswd #This line sets the password for user
        # echo "$USER:$PASSWORD" formats the username and the generated password into the format required by the chpasswd command (i.e., username:password).
        echo "The temporary password for the $USER is $PASSWORD"
        

    fi
else
    echo " Please enter the valid user"
fi
