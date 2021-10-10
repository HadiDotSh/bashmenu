#!/bin/bash
# Bash Menu
# By @HadiDotSh
options=()
nOption=0
selected=0
tput sc 
tput civis

trap exitt INT
function exitt() {
    tput cnorm && tput rc && printf "\r                            " && tput rc && exit
}

function alternative(){
    [[ -z ${subtitle} ]] && printf "\e[1;93m- \e[0m\e[1;77m%s\e[0m\n" "${title}" || printf "\e[1;93m- \e[0m\e[1;77m%s\e[1;93m [%s]\e[0m\n" "${title}" "${subtitle}"
    
    for (( i=0 ; i<nOption ; i++ ));do
        printf "\n\e[0;90m[\e[0;93m%s\e[0;90m] \e[0m\e[1;77m%s\e[0m" "${i}" "${options[$i]}"
    done 

    read -p $'\n\n\e[1;93m+\e[0m\e[1;77m Choice: \e[1;93m' selected
    printf "\e[0m\n"
}

function display(){
    tput rc
    [[ -z ${subtitle} ]] && printf "\e[1;93m- \e[0m\e[1;77m%s\e[0m\n" "${title}" || printf "\e[1;93m- \e[0m\e[1;77m%s\e[1;93m [%s]\e[0m\n" "${title}" "${subtitle}"

    for (( i=0 ; i<nOption ; i++ ));do
        [[ $selected == $i ]] && printf "\n\e[0;93m> \e[0m\e[1;93m%s\e[0m" "${options[$i]}" || printf "\n\e[0;93m  \e[0m\e[1;77m%s\e[0m" "${options[$i]}"
    done
}

function keyboard(){
    IFS= read -r -sn1 t
    if [[ $t == A ]]; then
        [[ "$selected" == "0" ]] || selected=$((selected - 1))
        
    elif [[ $t == B ]]; then
        [[ "$selected" == "$(( nOption-1 ))" ]] || selected=$((selected + 1))
    
    elif [[ $t == "" ]];then
        break
    fi
}

[[ -z "$*" ]] && exit
while [[ ! -z "$*" ]];do

    if [[ "$1" == "-t" || "$1" == "--title" ]];then
        shift && title=$1 && shift
    
    elif [[ "$1" == "-s" || "$1" == "--subtitle" ]];then
        shift && subtitle=$1 && shift

    elif [[ "$1" == "-a" || "$1" == "--alternative" ]];then
        shift && alternative=true

    else
        options[${nOption}]="$1"
        let nOption++
        shift
    fi
    
done

[[ ${alternative} == true ]] && alternative || while true;do display && keyboard ; done
export selected && tput cnorm && tput rc && printf "\r                            " && tput rc