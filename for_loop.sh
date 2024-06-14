#! /bin/bash

echo "Enter the last number to end :"
read Number

for ((i=1; i<=$Number; i++)); do
    echo $i
done