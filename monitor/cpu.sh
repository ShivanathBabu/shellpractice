#!/bin/bash
warning=70
critical=75
paths="/"

for path in $paths 
do
    cpuload=$(top -b -n 2 -d1 | grep "Cpu(s)" | tail -n 1 | awk '{print $2}' | awk -F . '{print $1}')

if [ -n "$warning" ] && [ -n "$critical" ]; then
if [ $cpuload -ge $warning ] && [ $cpuload -lt $critical ]; then
echo "cpu load is greater than $warning% but less than $critical%"
exit 1
elif [ $cpuload -ge $critical ]; then
echo " cpu load is greater than $critical" 
exit 2
else 
echo "cpu load is normal: $cpuload%"
exit 0
fi
else
echo "Warning or critical threshold is not set"
        exit 3
        fi
done