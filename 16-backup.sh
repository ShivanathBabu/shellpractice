#! bin/bash
userid=(id -u)
source_dir=$1
desti_dir=$2
days=${3:-14}
logs_folder="/var/log/backup-logs"
script_name=$( echo $0 | cut -d "." -f1 )
log= "$logs_folder/$script_name.log"

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

validate()
{
    if [ $1 -ne 0 ]
    then
    echo "$2..is $g sucess $n"
    else
    echo "$2..is $r failure $n"
    exit 1
    fi
}

checkroot()
{
    if [ $userid -ne 0]
    then
    echo "$r error: Run with root access $n"
    exit 1
    else
    echo "$g yo are in root access $n"
}


checkroot
mkdir -p $logs_folder

usage()
{
    echo -e "$r usage:: $n sh 16-backup.sh <source-dir> <destination-dir> <days(optional)>"
}

if [$# -lt 2]
then 
usage
fi

if [ ! -d $source_dir ]
thenecho -e "$r source directory $source_dir does not exit. please check $n"
exit 1
fi
if [ ! -d $desti_dir ]
thenecho -e "$r source directory $desti_dir does not exit. please check $n"
exit 1
fi

# files=$(find $source_dir -name "*.log" -mtime +$days)

# if[ !-]