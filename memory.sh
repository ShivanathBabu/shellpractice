#!/bin/bash

while true; do
mem_data=$(free -m | grep Mem)
total=$(echo $mem_data | awk -f '{print $2f}')
used=$(echo $mem_data | awk -f '{print $3f}')
usage=$(echo "$scale=1; ($used/$total)*100" | bc)
echo "memory usage: ${usage}%"
sleep 1
done