#!/bin/bash

USERID=$(id -u)

if [ $USERID  -ne 0 ]; then
    echo "error :: run with root privelege"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "error:: while installing"
 else 
    echo "installing mysql is success"
fi