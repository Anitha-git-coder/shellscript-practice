#!/bin/bash

USERID=$(id -u)

if [ $USERID  -ne 0 ]; then
    echo "error :: run with root privelege"
fi