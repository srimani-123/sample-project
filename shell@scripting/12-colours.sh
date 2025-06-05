#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"



VALIDATE(){
if [ $1 -ne 0 ]
then
    echo "$2 .. Failure"
    exit 1
else
    echo -e "$2 ....$G success"
fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1
fi

# Check and install MySQL
dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo -e "mysql is already ....$Y installed"
fi

# Check and install Git
dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "git is already ..... $Y installed"
fi

