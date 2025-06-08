#!/bin/bash
disk_usage=$(df -hT | grep -v Filesystem)
disk_thrishold=1
MSG=" "
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do
 usage=$(echo $line | awk '{print $6f}' | cut -d "%" -f1 )
 partition=$(echo $line | awk '{print $7f}')
 if [ $usage -ge $disk_thrishold ]
 then
   MSG+="High Disk Usage on $PARTITION: $USAGE % <br>"
  fi
done <<< $disk_usage

sh mail.sh "devops team" "high disk usage" "$IP" "$MSG" "shivanathbabu.kodimyala@gmail.com" "Alert high disk usage"