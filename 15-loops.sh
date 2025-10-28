#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"


LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
#echo "13-logs.sh" | cut -d "." -f1
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

USERID=$(id -u)

if [ $USERID  -ne 0 ]; then
    echo -e "error :: run with root privelege"
    exit 1
fi

mkdir -p $LOGS_FOLDER
echo "script started at $(date)" | tee -a $LOG_FILE

VALIDATE(){ # dont execute by itself ,executes only when called
 if [ $1 -ne 0 ]; then
    echo -e "error:: while installing $1  $R failure $W" | tee -a $LOG_FILE
    exit 1
 else 
    echo -e "installing $2 is $G success-full $W" | tee -a $LOG_FILE
fi
}

for PACKAGE in $@
do 
    echo "packages is: $PACKAGE"
done 