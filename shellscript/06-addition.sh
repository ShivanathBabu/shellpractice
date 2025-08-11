#!/bin/bash
Number=100
number2=200
timestamp=$(date)

echo " script executed at $timestamp"
sum=$(($number+$number2))
echo "the sum of $Number and $number2 is $sum"