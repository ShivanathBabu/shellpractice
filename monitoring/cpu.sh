#!/bin/bash

cpu_usage=$(top -bn1 | grep "cpu(s)" | awk '{print 100 - $8}')
cpu_thrishold=75

if [ [ $cpu_usage -ge $cpu_thrishold ]];
then
    echo "cpu usage is High: $cpu_usage %"
  else 
    echo "cpu usage is Normal: $cpu_thrishold %"
    fi
