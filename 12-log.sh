#!/bin/bash
userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logs_folder="/var/log/shellscript-logs"
script_file=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$script_file.log"
packages=("mysql" "python" "nginx" "httpd")
mkdir -p $logs_folder
echo "script started executing at: $(date)"| tee -a $log_file

if [ $userid -ne 0 ]
then
echo -e "$R ERROR: Run with sudo access $N" | tee -a $log_file
exit 1
else
echo -e "$G you are in sudo access $N" | tee -a $log_file
fi


validate()
{
    if [ $1 -eq 0 ]
    then 
    echo -e "$G $2 is succesfully installed $N" | tee -a $log_file
    else
    echo -e "$R $2 failed to install $N" | tee -a $log_file
    exit 1
    fi
}

for package in ${packages[@]}
do
dnf list installed $package &>>$log_file 
if [ $? -ne 0 ]
then
echo -e "$Y $package not yet installed $N" | tee -a $log_file
dnf install $package -y &>>$log_file
validate $? "mysql"
else
echo -e "$G $package already installed $N" | tee -a $log_file
fi
done

