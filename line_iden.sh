#! /bin/bash

set -e

read jevaa.txt

awk '{if(NR==10) print $0}' jevaa.txt



