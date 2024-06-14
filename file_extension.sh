#! /bin/bash

echo "Enter the Dource Directory"
read source_dic

echo "Enter the Destination Directory"
read destination_dic

mkdir -p "$destination_dic" # checks for directory

#Error handling

if [ ! -d "$source_dic" ]; then
    echo "The Source Directory $source_dic is not found!!!:("
    exit 1
fi

if [ ! -d "$destination_dic" ]; then
    echo "The Destination Directory $destination_dic is not found!!!:("
    exit 1
fi

for file in "source_dic/*"; do
    if [ -f "$file" ]; then
    extension="${file##.}"

    mkdir -p "$destination_dic/$extension"

    mv "$file" "$destination_dic/$extension/"

    echo "Moved the $file to this location : $destination_dic/$extension"
done
