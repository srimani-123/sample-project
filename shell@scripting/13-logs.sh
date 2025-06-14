#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
mkdir -p $LOGS_FOLDER

LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# Optional: Redirect output to log file
# exec > >(tee -a $LOG_FILE_NAME) 2>&1

VALIDATE(){
  if [ $1 -ne 0 ]
  then
      echo -e "$2 .. ${R}Failure${N}"
      exit 1
  else
      echo -e "$2 .... ${G}Success${N}"
  fi
}

echo "Script started executing at: $TIMESTAMP"

if [ $USERID -ne 0 ]
then
    echo -e "${R}ERROR: You must have sudo access to execute this script${N}"
    exit 1
fi

# Check and install MySQL
dnf list installed mysql > /dev/null 2>&1
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo -e "MySQL is already .... ${Y}installed${N}"
fi

# Check and install Git
dnf list installed git > /dev/null 2>&1
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already .... ${Y}installed${N}"
fi

