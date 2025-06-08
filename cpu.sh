#!/bin/bash

while true; do
cpu_idle=$(top -b -n2 | grep "Cpu(s)" | tail -1 | awk-F ',' '{print $4}'|awk '{print $1}')
cpu_utilization=$(echo "scale=1; 100 - $cpu_idle" | bc)
echo "cpu usage": ${cpu_utilization}%"
sleep 1
done

# top -b -n2
# Get CPU info accurately (run it twice and discard first line).

# -b: batch mode, used for scripts
# -n2: run it twice because the first result is often inaccurate.
# grep "Cpu(s)" | tail -1

# Grab the line showing CPU usage.

# awk -F',' '{print $4}'

# Cuts out the 4th value, which is:

# echo "100 - $cpu_idle" | bc

# Uses bc (calculator) to subtract idle from 100:

# 100 - 94.0 = 6.0 → CPU is using 6.0%

# In bc, scale sets how many digits to keep after the decimal point