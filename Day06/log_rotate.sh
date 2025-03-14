# Create a script to rotate the logs when the size of the log file reaches the 100MB and take back up
# of the log file with the timestamp.
# File_location = var/log/syslog
# backup_dir= /var/log/app/backup

#!/bin/bash

LOG_FILE="/var/log/syslog"
MAX_SIZE="100000000"
BACKUP_DIR="/var/log/myapp/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p $BACKUP_DIR

rotate_logs() {
    if [ -f $LOG_FILE ]; then
        echo "rotating the log file":$LOG_FILE
        mv "$LOG_FILE" "$BACKUP_DIR/myapp_$TIMESTAMP.log"
        touch $LOG_FILE
        echo "Log file rotated and stored as  $BACKUP_DIR/myapp_$TIMESTAMP.log"
    else
        echo " Log file $LOG_FILE didn't found "
    fi
}

if [ -f $LOG_FILE ]; then
    FILE_SIZE=$(stat -c%s $LOG_FILE) #Get the size of the file in bytes
    if [ $FILE_SIZE -gt $MAX_SIZE ]; then
        rotate_logs
    else
        echo "Log File size in under control:" $FILE_SIZE
    fi
else
    echo " Log File doen't exist"
fi

