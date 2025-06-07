#!/bin/bash
source_dir=/home/ec-user/app-logs
file_to_delete=$(find $source_dir -name "*.log" -mtime +14)
while IFS= read -r file
do
 rm -rf $file
 done <<< $files_to_delete