#!/bin/bash

validate() {
if [ $1 -ne 0 ]
then
	echo "The given statement is false"
else
	echo "The given statement is $2"
fi 
}



echo "hello world"

validate $? true



