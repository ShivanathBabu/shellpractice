#!/bin/bash
disk_usage=$(df -hT | grep -v Filesystem)
disk_thrishold=1
msg=" "
while IFS= read line
do
 usage=$(echo $line | awk '{print $6f}' | cut -d "%" -f1 )
 partition=$(echo $line | awk '{print $7f}')
 if [ $usage -ge $disk_thrishold ]
 then
  msg+= "high disk usage on $partition: $usage"
  fi
done <<< $disk_usage