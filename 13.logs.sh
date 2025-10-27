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
echo "script started at $(date)"

VALIDATE(){ # dont execute by itself ,executes only when called
 if [ $1 -ne 0 ]; then
    echo -e "error:: while installing $1  $R failure $W"
    exit 1
 else 
    echo -e "installing $2 is $G success-full $W"
fi
}

dnf list installed mysql &>>$LOG_FILE 
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>>$LOG_FILE 
    VALIDATE $? "mysql"
else 
echo -e "$Y skipping $W"
fi

dnf list installed nginx &>>$LOG_FILE 
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE 
    VALIDATE $? "nginx"
else 
echo -e "$Y skipping $W"
fi

dnf list installed python3 &>>$LOG_FILE 
if [ $? -ne 0 ]; then 
    dnf install python3 -y &>>$LOG_FILE 
    VALIDATE $? "python3"
else 
echo -e "$Y skipping $W"
fi



