#utilize exit codes to control the script flow
#!/bin/bash
aws --version
if [ $? -eq 0 ]; then
   # proceed with the script
   echo "proceed"
else
    echo "AWS cli not found! exiting!!!"
    
fi

