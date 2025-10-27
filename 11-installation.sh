#!/bin/bash

USERID=$(id -u)

if [ $USERID  -ne 0 ]; then
    echo "error :: run with root privelege"
    exit 1
fi

VALIDATE(){# dont execute by itself ,executes only when called
 if [ $1 -ne 0 ]; then
    echo "error:: while installing $1"
    exit 1
 else 
    echo "installing $2 is success-full"
fi
}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"

