#!/bin/bash

# Main Function for generating passwords
main(){
	echo -n "Victim's Name : "
	read name

	echo -n "Enter Victim's father's name: "
	read father

	echo -n "Enter Victim's mother's name: "
	read mother

	echo -n "Enter Victim's pet's name: "
	read pet_name

	echo -n "Enter Victim's birth city: "
	read born_city

	echo -n "Enter Victim's DOB (DDMMYYYY): "
	read dob

	# Combine all the inputs
	character_crunch="${name}${father}${mother}${pet_name}${born_city}${dob}"

	$final=repeat_character()

	echo -n "Do you Want Multiple Length(M) or Same Length(S) : "
	read length

	while true; do
		if [[ $length == "M" ]]; then 
			echo -n "Minimum Length to generate Password: "
			read min

			echo -n "Maximum Length to generate Password: "
			read max

			# Using crunch tool to generate password
			crunch $min $max "${final}" -o "$filename"

			if [[ $? -eq 0 ]]; then
				echo "$filename is successfully generated..."
				exit 0
			else
				echo "Error: Failed to generate passwords."
				exit 1
			fi

		elif [[ $length == "S" ]]; then
			echo -n "How many Words : "
			read word

			echo -n "How many numbers : "
			read number

			echo -n "How many symbols : "
			read symbol

			pattern=""

			# Generate pattern based on user input
			for ((i = 1; i <= word; i++)); do
				pattern+="@"
			done

			for ((j = 1; j <= number; j++)); do
				pattern+="%"
			done

			for ((k = 1; k <= symbol; k++)); do
				pattern+="^"
			done

			crunch $min $max -t "${final}${pattern}" -o "$filename"

			if [[ $? -eq 0 ]]; then
				echo "$filename is successfully generated..."
				exit 0
			else
				echo "Error: Failed to generate passwords."
				exit 1
			fi
		else
			echo "Enter Either M or S"
			echo -n "Do you Want Multiple Length(M) or Same Length(S) : "
			read length
		fi
	done
}

# Function for repeated character
repeat_character() {
	sorted_chars=$(echo "$character_crunch" | grep -o . | sort -u | tr -d '\n')
	echo "$sorted_chars"
}

# Function to get the file extension
file_extension() {
  extension="${filename##*.}"
}

# Read filename
echo -n "Enter the output filename (with .txt extension): "
read filename

# Call the function to get the file extension
file_extension

# Check if the file exists
if [[ -f "$filename" ]]; then
  # Check the file extension
  if [[ $extension == "txt" ]]; then
    main
  else
    echo "You have given the wrong file extension"
    exit 1
  fi
else
  # Create the file if it doesn't exist
  touch "$filename"
  echo "Successfully Created $filename"
  
  # Check the file extension
  if [[ $extension == "txt" ]]; then
    main
  else
    echo "You have given the wrong file extension"
    exit 1
  fi
fi
