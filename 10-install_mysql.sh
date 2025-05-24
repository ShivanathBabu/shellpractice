#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo " ERROR: Run with root access"
else
echo " you are in root access"
fi

validate() {
    if [ $1 -eq 0 ]
    then
    echo " $2 is installed"
    else
    echo "$2 failed to install"
    exit 1
}

dnf list installed mysql

if [ $? -ne 0 ]
then
echo "mysql is not installed.....installing"
dnf install mysql -y
validate $? "mysql"
else
echo "mysql already installed"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then 
echo " nginx not installed...installing"
dnf install nginx -y
validate $? "nginx"
else
echo "nginx already installed"
fi