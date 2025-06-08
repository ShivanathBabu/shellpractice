#!/bin/bash
disk_usage=$(df -hT | grep -v Filesystem)
disk_thrishold=1
MSG=""
IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do
 USAGE=$(echo "$line" | awk '{print $6f}' | cut -d "%" -f1 )
 PARTITION=$(echo "$line" | awk '{print $7f}')
 if [ $USAGE -ge $disk_thrishold ]
 then
   MSG+="High Disk Usage on $PARTITION: $USAGE % <br>"
  fi
done <<< $disk_usage

sh mail.sh "DevOps Team" "Disk Alert" "$IP" "$MSG" "shivanathbabu.kodimyala@gmail.com" "Disk Alert on $IP"
