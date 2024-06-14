#!/bin/bash

echo "Enter Your Mark :"
read Number

case 1 in
    $(($Number >= 90)) ) echo "Your Grade is A";;
    $(($Number >= 80)) ) echo "Your Grade is B";;
    $(($Number >= 70)) ) echo "Your Grade is C";;
    $(($Number >= 60)) ) echo "Your Grade is D";;
    $(($Number >= 50)) ) echo "Your Grade is E";;
    *) echo "You have failed!!!, Poor :("; 
esac
