#!/bin/bash

#DATE=$(date)
#echo "timestamp executed is $DATE"

START_TIME=$(date +%s)

sleep 20 &

END_TIME=$(date +%s)

TOTAL_TIME=$($END_TIME-$START_TIME)

echo "executed timestamp is : $TOTAL_TIME seconts"