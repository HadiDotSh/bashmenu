#!/bin/bash
# Bash Menu exemple
# By @HadiDotSh
source bashmenu.sh -t "My Title" -s "By Hadi.sh" "Option 1" "Option 2" "Last Option"


if [[ ${selected} == "0" ]];then
    printf "You choose the first option"

elif [[ ${selected} == "1" ]];then
    printf "You choose the second option"

elif [[ ${selected} == "2" ]];then
    printf "You choose the last option"
fi