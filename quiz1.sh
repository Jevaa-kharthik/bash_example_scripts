#! /bin/bash

declare -A arr

arr=([Two]='2' [One]='1'

for key in ${!arr[@]}; do
  echo $key ${arr[$key]}
done | sort -n -k2,2
