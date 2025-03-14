#!/bin/bash

USER=$1
if [[ $USER =~ ^[a-z]{3}[0-9]{3}$ ]]; then
    echo "username is valid"
else
    echo "username is invalid"
fi
 
