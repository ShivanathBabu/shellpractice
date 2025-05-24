#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo " ERROR: Run with root access"
else
echo " you are in root access"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
echo "mysql unable to install"
exit 1
else
echo "mysql successfully installed"
fi