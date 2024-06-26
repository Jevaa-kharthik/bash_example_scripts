#! /bin/bash

echo -n "Enter the filename: "
read filename

nmap_scan(){
    for i in {64..70}; do
        nmap -sn 172.168.$i.1/24 >> $filename
    done
} 

if [ -f $filename ]; then
    nmap_scan
else
    touch $filename
    nmap_scan
fi
