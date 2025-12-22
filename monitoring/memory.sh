#!/bin/bash
 memo_used=$(free -m | awk '/Mem:/ {print $3}')
 memo_total=$(free -m | awk '/Mem:/ {print $2}')

 memo_total=$(( 100 *$memo_used / $memo_total ))

 echo "Memeory_usage: $memo_total %"