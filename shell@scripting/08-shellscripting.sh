#!/bin/bash

Number=$1

if [ "$Number" -gt 100 ]
then
	echo "The given number is greater than 100"
else
	echo "The given number is less than 100"
fi

