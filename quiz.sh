#! /bin/bash

echo -n 'Enter a number: '
read num
if [ $num -eq 10 ]; then
    echo 'True'
else
    echo 'False'
fi
