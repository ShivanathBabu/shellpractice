#!/bin/bash

warning=70
critical=75

mem_used=$( free | grep Mem | awk '{print $3}' )
mem_total=$( free | grep Mem | awk '{print $2}')
mem_usage=$(( 100 * mem_used / mem_total ))
 echo "memory usage: $mem_usage%"

 if [ $mem_usage -ge $warning ]; then
 echo "WARNING: memory usage is greater than $warning%"
 exit 1
 elif [ $mem_usage -ge $critical ]; then
echo "CRITICAL: memory usage is greater than $critical%"
exit 1
else
echo "Memory usage is normal"
exit 1
fi
