#!/bin/bash
userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

logs_folder="/var/log/shell-logs"
script_folder=$(echo $0 | cut -d "." -f1)
Log_file="$logs_folder/$script_folder.log"
source_dir=/home/ec2-user/app-logs

mkdir -p $logs_folder

if [ $userid -ne 0 ]
then
echo -e "$r ERROR: run with sudo access $n"
exit 1
else
echo "you are in sudo access"
fi

validate()
{
    if [ $1 -eq 0 ]
    then
    echo -e "$2 is $g succes $n"
    else
    echo -e "$2 is $r failure $n"
    exit 1
    fi
}
echo "script started at $(date)"
files=$(find $source_dir -name "*.log" -mtime 14)
validate $? "files deleted"
while IFS= read -r filepath
do
  rm -rf $filepath
done <<< $files

echo "script executed successfully"