#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"


USERID=$(id -u)

if [ $USERID  -ne 0 ]; then
    echo -e "error :: run with root privelege"
    exit 1
fi

VALIDATE(){ # dont execute by itself ,executes only when called
 if [ $1 -ne 0 ]; then
    echo -e "error:: while installing $1  $R failure $W"
    exit 1
 else 
    echo -e "installing $2 is $G success-full $W"
fi
}

dnf list installed mysql 
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE $? "mysql"
else 
echo -e "$Y skipping $W"
fi

dnf list installed nginx 
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
echo -e "$Y skipping $W"
fi

dnf list installed python3 
if [ $? -ne 0 ]; then 
    dnf install python3 -y
    VALIDATE $? "python3"
else 
echo -e "$Y skipping $W"
fi