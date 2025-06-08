#!/bin/bash

while true; do
cpu_idle=$(top -b -n2 | grep "Cpu(s)" | tail -1 | awk -F ',' '{print $4}'|awk '{print $1}')
cpu_utilization=$(echo "scale=1; 100 - $cpu_idle" | bc)
echo "cpu usage": ${cpu_utilization}%"
sleep 1
done