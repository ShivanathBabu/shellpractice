#!/bin/bash
userid=$(id -u)
source_dir=$1
dest_dir=$2
days=${3:-14}

logs_folder="/var/log/script-logs"
script_name=$(echo $0 | cut -d "." -f1 )
log_file="$logs_folder/$script_name.log"
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

validate()
{
    if [ $1 -eq 0 ]
    then
    echo -e "$2...$g success $n"
    else
    echo -e "$2...$r failure $n"
    fi
}

checkroot(){
    if [ $userid -ne 0 ]
    then
    echo -e "$r ERROR: Run with Root Access $n"
    else
    echo -e "$g Your are in Root access $n"
    fi
}

checkroot
mkdir -p $logs_folder

usage(){
     echo -e "$r USAGE:: $n sh 20-backup.sh <source-dir> <destination-dir> <days(optional)>"
     exit 1
}



if [ $# -lt 2 ]
then
usage
fi

if [ ! -d $source_dir ]
then
echo -e "$r source directory $source_dir does not exit please check $n"
exit 1
fi

if [ ! -d $dest_dir ]
then
echo -e "$r destination directory $dest_dir does not exit please check $n"
exit 1
fi

files=$(find $source_dir -name "*.log" -mtime +$days)

if [ ! -z $files ]
then
echo "files to zip: $files"
timestamp=$(date +%F-%H-%M-%S)
zip_file="$desti_dir/app-logs-$timestamp.zip"
find $source_dir -name "*.log" -mtime +$days | zip -@ "$zip_file"

if [ -f $zip_file ]
then
echo -e "successfully created zip file"
while IFS= read -r filepath
do
echo -e "Deleting files: $filepath"
rm -rf $filepath
done <<< $files 
echo -e "log files older than $days from source directory removed.. $g success $n"
else
echo -e "zip file $r failure $n"
exit 1
fi
else
echo -e "no log files found older than 14 days..$y skipping $n"
fi 

