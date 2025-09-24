#!/bin/bash
disk_usage=$(df -hT | grep -v Filesystem)
dis_threshold=1
MSG=""
IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
while IFS= read line
do
    usage=$( echo $line | awk '{print $6F}' | cut -d "%" -f1 )
    partion=$(echo $line | awk '{print $7F}')
    if [ $usage -ge $dis_threshold ]
then
    MSG+="High disk usage on $partion: $usage \n"
fi
done <<< $disk_usage
#echo -e $MSG

sh mail.sh "DEVOPS TEAM" "High disk usage" "$IP" "$MSG" "shivanathbabu.kodimyala@outlook.com" "Alert High Disk usage"