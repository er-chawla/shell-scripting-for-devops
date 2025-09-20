#!/bin/bash


num=0

while [[ `exp $num % 2 == 0` &&  $num -le 5 ]]
do 
	echo $num
	((num++))
done
