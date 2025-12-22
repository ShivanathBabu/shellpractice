#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=1

while IFS= read -r line
do 
    usage=$( echo "$line" | awk '{print $6)' | cut -d "%" -f1 )
    partition=$( echo "$line" | awk '{print $7}')
    if [ "$usage" -ge "$disk_threshold" ];
    then
        echo "disk usage is high on $partition"
    fi
    done <<< $disk_usage
    