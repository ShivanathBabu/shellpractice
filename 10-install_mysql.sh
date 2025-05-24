#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo " ERROR: Run with root access"
else
echo " you are in root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
echo "mysql is not installed.....installing"
dnf install mysql -y
if [ $? -ne 0 ]
then
echo "mysql succesfully installed"
else
echo " mysql failed to install"
exit 1
fi
else
echo "mysql already installed"
fi