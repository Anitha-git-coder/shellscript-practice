#!/bin/bang
NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "$NUMBER is less then 10 "
else
    echo "$NUMBER is gt eq 10"
fi

echo "plz enter a num"
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "even"
elif [ $(($NUMBER %2)) -ne 0 ]; then
    echo "odd"
else 
    echo "not num"
fi