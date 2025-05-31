#! bin/bash
userid=$(id -u)
source_dir=$1
desti_dir=$2
days=${3:-14}
logs_folder="/var/log/backup-logs"
script_name=$( echo $0 | cut -d "." -f1 )
log="$logs_folder/$script_name.log"

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

validate()
{
    if [ $1 -eq 0 ]
    then
    echo -e"$2..is $g sucess $n"
    else
    echo -e"$2..is $r failure $n"
    exit 1
    fi
}

checkroot()
{
    if [ $userid -ne 0 ]
    then
    echo -e "$r error: Run with root access $n"
    exit 1
    else
    echo -e "$g yo are in root access $n"
    fi
}

checkroot
mkdir -p $logs_folder




usage()
{
    echo -e "$r usage:: $n sh 16-backup.sh <source-dir> <destination-dir> <days(optional)>"
}

if [ $# -lt 2 ]
then 
usage
fi

if [ ! -d $source_dir ]
then
echo -e "$r source directory $source_dir does not exit. please check $n"
exit 1
fi
if [ ! -d $desti_dir ]
then
echo -e "$r source directory $desti_dir does not exit. please check $n"
exit 1
fi

files=$(find $source_dir -name "*.log" -mtime +$days)

if[ !-z $files ]
then
echo "Files to zip: $files"
timestamp=$(date + %f -%h -%m -%s)
zip_file="$desti_dir/app-logs-$timestamp.zip"
find $source_dir -name "*.log" -mtime +$days | zip -@ "$zip_file"

if [ -f $zip_file ]
then
echo -e "$g successfully created zip file $n"
while IFS= read -r filepath
do
echo "deleting files: $filepath" | tee -a $log
rm -rf $filepath
done <<< $files

echo -e "log files older than $days from source directory removed...$g success $n"
else
echo -e "zip files creation....$r failure $n"
exit 1
fi
else
echo -e "no log files found older than 14 days...$y skipping $n"
fi
