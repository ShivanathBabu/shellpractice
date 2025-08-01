# #!/bin/bash
# source_dir=/home/ec2-user/app-logs
# file_to_delete=$(find $source_dir -name "*.log" -mtime +14)
# while IFS= read -r file
# do
#   echo "deleting files: $file"  
#   rm -rf $file
#   if [ $? -ne 0 ]
#   then
#   echo "failed to delete files"
#   else
#   echo  "successfully deleted files"
#   fi
 
#  done <<< $file_to_delete

#!/bin/bash

# find "$source_dir" -name "*.log" -mtime +14 | while IFS= read -r file
# do
#   echo "Deleting file: $file"
#   rm -f "$file"
# done

#!/bin/bash
source_dir=/home/ec2-user/app-logs
files_to_delete=$(find $source_dir . -name "*.log" -mtime +14)

while IFS= read -r  filepath
do
  rm -rf $filepath
  done <<< $files_to_delete