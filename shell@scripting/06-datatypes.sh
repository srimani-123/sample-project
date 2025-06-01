#!/bin/bash


echo "enter your first number"
read number1

echo "enter your second number"
read number2


sum=$((number1+number2))
echo "Sum of $number1 + $number2 = $sum"


Timestamp=$(date)
echo "script executed at :$Timestamp"

