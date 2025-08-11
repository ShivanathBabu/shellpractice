#!/bin/bash

warning=70
critical=75
paths="/"  # you used "path" twice; also changed to plural for clarity

for path in $paths
do
    # Remove the space after cpuload= and fix command substitution
    cpuload=$(top -b -n 2 -d 1 | grep "Cpu(s)" | tail -n 1 | awk '{print $2}' | awk -F . '{print $1}')

    # Check if warning and critical are set (not empty)
    if [ -n "$warning" ] && [ -n "$critical" ]; then

        if [ "$cpuload" -ge "$warning" ] && [ "$cpuload" -lt "$critical" ]; then
            echo "CPU load is greater than $warning% but less than $critical%"
            exit 1
        elif [ "$cpuload" -ge "$critical" ]; then
            echo "CPU load is greater than or equal to $critical%"
            exit 2
        else
            echo "CPU load is normal: $cpuload%"
            exit 0
        fi

    else
        echo "Warning or critical threshold is not set"
        exit 3
    fi
done
