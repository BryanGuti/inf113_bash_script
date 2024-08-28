#!/bin/bash

GREEN="\u001b[32m"
RED="\u001b[31m"
WHITE="\u001b[37m"

expresion_regular="^[1-9][0-9]*$"

while true
do
    clear
    echo -e "\n\t\tAVERIGUE SI UN NUMERO ES PRIMO"
    echo -e "\t\t------------------------------\n"
    echo -en "\t\tIngrese un numero: " && read numero

    if ! [[ $numero =~ $expresion_regular ]]; then
        echo -en "\n\t\t$numero no es un numero válido " && read -s tecla
        continue
    fi

    if [[ $numero == 1 ]]; then
        echo -en "$RED\n\t\t$numero no es un numero primo $WHITE"
        read -s tecla && echo
        break
    fi

    for (( i=2; i <= $numero; i++ ))
    do
        if [[ $(($numero % $i)) > 0 ]]; then
            continue
        fi

        if (( ($(($numero % $i)) == 0) && ($i < $numero) )); then
            echo -en "$RED\n\t\t$numero no es un numero primo $WHITE"
            read -s tecla && echo
            break
        fi

        echo -en "$GREEN\n\t\t$numero es un numero primo $WHITE"
        read -s tecla && echo
    done

    break
done
