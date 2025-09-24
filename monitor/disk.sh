#!/bin/bash
disk_usage=$(df -hT | grep -v Filesystem)
dis_threshold= 1
MSG= " "
while IFS = read line
do
usage=$( df -hT | awk '{print $6F}' | cut -d "%" -F1 )
partion=$(df -hT | awk '{print $7F}')

if [ $usage -gt $dis_threshold ]
then
    MSG+= "High disk usage on $partion: $usage %"
fi
done <<< $disk_usage
echo -e $MSG