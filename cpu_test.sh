#!/bin/bash
cpu_usage=$( top -bn1 | grep "Cpu(s)" | awk '{printf 100-$8}')
cpu_int=${cpu_usage%.*}
if [ "$cpu_int" -gt 75 ]
then
echo "$(date '%Y-%M-%d %H:%M:%S')-High Cpu usage ${cpu_usage}%"
else
echo "$(date '%Y-%M-%S %H:%M:S')- cpu usage is normal ${cpu_usage}%"
fi 
