#!/bin/bash
userid=$(id -u)
source_dir=$1
dest_dir=$2
days=${3:-14}

logs_folder= "/var/log/script-log"
script_name= $(echo "$0" | cut -d "." -f1)
log_file= "$logs_folder/$script_name.log"


checkroot() {
if [ $userid -ne 0 ]
then
    echo "run with sudo access"
    exit 1
else
    echo "you are in sudo access"
    fi
}

checkroot
mkdir -p $logs_folder

validate() {
    if [ $1 -eq 0 ]
    then 
        echo "$2 success"
    else
        echo "$2 failure"
    fi
}

usage()
{
    echo "usage: backup.sh <source_dir> <destination-dir> <days(optional)>"
    exit 1
}

if [ $# -lt 2 ]
then
    usage
  fi
  
if [ ! -d "$source_dir" ]
then
    echo "$source_dir doesn't exist"
    exit 1
fi

if [ ! -d "$dest_dir" ]
then
    echo "$dest_dir doesn't exist"
    exit 1
fi

files=$(find $source_dir -name "*.log" -mtime +$days)

if [ ! -z "$files" ]
then
    echo "files to zips are: $files"
    timestamp=$(date +%F-%H-%M-%S)
    zip_file="$dest_dir/app-logs-$timestamp.zip"
    find $source_dir -name "*.log" -mtime +$days | zip -@ "$zip_file"

    if [ -f $zip_file ]
    then
    echo "zip file successfully created"

    while IFS= read -r filepath
    do
        echo "deleting $filepath | tee -a $log_file"
        rm -rf $filepath
    done <<< $files
    echo "sucessfully deleted files $days "
    else
    echo "zip file failed"
    exit 1
    fi
    else
    echo -e "no log files found"

fi


