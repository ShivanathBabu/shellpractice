#!/bin/bash
old= "hello"
new= "Update"

# loop all .txt files
for file in *.txt; do
if [ -f "$file" ]; # check its regular file
then
echo "processing $file"
sed -i "s/$old/$new/g" "$file"
fi 
done