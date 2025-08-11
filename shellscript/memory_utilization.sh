#!/bin/bash
memory_usage=$( free | awk '/Mem/ {printf "%.0f", $3/$2*100}')
Threshold=75
echo "current memory usage: $memory_usage%"
if [ "$memory_usage" -gt "$Threshold" ]
then
echo "Alert memory usage above ${Threshold}%!"
else
echo "memory usage is within limit"
fi
