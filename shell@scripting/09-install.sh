#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]
then
	echo "Error: u must have sudo access"
	exit 1
else
	echo "U are a sudo user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
	echo "installing mysql .... Failure"
else
	echo "installing mysql ... Success"
fi


