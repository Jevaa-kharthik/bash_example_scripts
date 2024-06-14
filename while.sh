#! /bin/bash

echo "Enter the Number to loop : "
read Excepted_number

Number=1
while [[ $Number -le $Excepted_number ]]; do
    echo "$Number"
    (( Number += 1 ))
done