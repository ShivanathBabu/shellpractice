#!/bin/bash
userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]
then
echo -e "$R ERROR: RUN WITH ROOT ACCESS $N"
else
echo -e "$G you are running with root access"
fi

validate() {
    if [ $1 -eq 0 ]
    then
    echo -e "$G $2 SUCCESFULLY INSTALLED $N"
    else
    echo -e "$Y $2 ALREADY INSTALLED $N"
    fi
}
dnf list installed mysql

if [ $? -ne 0 ]
then
echo -e "$G mysql...installing $N"
dnf install mysql -y
validate $? "mysql"
else
echo -e " $Y already installed $N"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then
echo -e "$G nginx...installing $N"
dnf install nginx -y
validate $? "nginx"
else
echo -e "$Y already installed $N"
fi