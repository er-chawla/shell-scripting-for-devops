#!/bin/bash


<<disclaimer
This shell script is used for to check today is sunny day or not?
disclaimer

read -p "Enter today is what day: " todayWeather

read -p "Enter chances: " chances

if [[ $todayWeather == "sunny" ]];
then 
	echo "Today weather is $todayWeather"
elif [[ $chances -ge 100 ]];
then
	echo "Today weather sure is $todayWeather"
else
	echo "Today weather is not $todayWeather"
fi
