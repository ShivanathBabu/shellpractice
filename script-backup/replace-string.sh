#!/bin/bash
old="hello"
new="Update"

target_dir="/home/ec2/files"
# loop all .txt files
for file in "$target_dir"/*.txt; do
if [ -f "$file" ]; # check its regular file
then
echo "processing $file"
sed -i "s/$old/$new/g" "$file"
fi 
done