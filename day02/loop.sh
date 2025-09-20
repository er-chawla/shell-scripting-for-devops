#!/bin/bash


# This is for and while loops

for ((i = $2; i < $3; i++));
do
	mkdir "$1$i"
done
