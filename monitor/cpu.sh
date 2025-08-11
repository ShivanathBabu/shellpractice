#!/bin/bash
warning=70
critical=75
paths= "/"

for path in $paths 
do
    cpuload=$(top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' | awk -F . '{print $1}')

if [ -n $warning ] && [ -n $critical ]; then
if [ $cpuload -ge $warning ] && [ $cpuload -lt $critical ]; then
echo "cpu load is greater then $warning% but less than $critical%"
exit 1
elif [ $cpuload -ge $critical ]; then
echo " cpu load is greater then $critical" 
exit 1
fi
else 
echo "cpu load is normal"
fi
done


