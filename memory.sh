#!/bin/bash

while true; do
mem_data=$(free -m | grep Mem)
total=$(echo $mem_data | awk '{print $2}')
used=$(echo $mem_data | awk  '{print $3}')
usage=$(echo "$scale=1; ($used/$total)*100" | bc)
echo "memory usage: ${usage}%"
sleep 1
done