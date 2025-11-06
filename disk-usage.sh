#!/bin/bash
DISK_USAGE=$(df -hT | grep -v filesystem)
DISK_THRESHOLD=2 # in projects its 75 
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS= read  -r line 
do 
USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
PARTITION=$(echo $line | awk '{print $7}') 
if [ $USAGE -ge $DISK_THRESHOLD ]; then 
# echo "high usage on $PARTITION: $USAGE"
MESSAGE+="high usage on $PARTITION: $USAGE % \n"
fi
done <<< $DISK_USAGE

echo -e "message body : $MESSAGE"