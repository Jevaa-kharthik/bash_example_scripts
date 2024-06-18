#! /bin/bash

echo -n "Enter Father name :"
read father

echo -n "Enter Mother name : "
read mother

echo -n "Enter Pet name : "
read pet_name

echo -n "Born City : "
read born_city

echo -n "Date of Birth YYYY-MM-DD : "
read dob

echo "The Filename Extension should end with .txt"
echo -n "Enter Filename : "
read filename

file_extension(){
	extension="${filename##*.}"
}

file_extension

if [[ $extension == "txt" ]]; then
	echo -n "Minimum Length to generate Password : "
	read min

	echo -n "Maximum Length to generate password : "	
	read max

	character_crunch="${father}${mother}${pet_name}${born_city}${dob}"

	#using crunch tool to generate password

	crunch $min $max -t "${character_crunch}@@@@@@@" -o $filename

	echo "$filename is Successfully Generated..."
else
	echo "You have given the wrong file extension"
	exit
fi


