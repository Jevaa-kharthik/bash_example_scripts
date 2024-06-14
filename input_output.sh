#! /bin/bash

echo "Enter Filename : "
read filename

if [ -e $filename ]; then
	echo "$filename is already exist"
	cat $filename
else
	touch $filename
	echo "$filename is created"
fi
