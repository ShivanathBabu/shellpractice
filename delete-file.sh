#!/bin/bash
source_dir=/home/ec2-user/app-logs
file_to_delete=$(find $source_dir -name "*.log" -mtime +14)
while IFS= read -r file
do
 rm -rf $file
 done <<< $file_to_delete