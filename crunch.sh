#!/bin/bash

# Main Function for generating passwords
main(){
  echo -n "Minimum Length to generate Password: "
  read min

  echo -n "Maximum Length to generate Password: "
  read max

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

  # Using crunch tool to generate password
  crunch $min $max "${character_crunch}" -o "$filename"

  if [[ $? -eq 0 ]]; then
    echo "$filename is successfully generated..."
  else
    echo "Error: Failed to generate passwords."
    exit 1
  fi
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
