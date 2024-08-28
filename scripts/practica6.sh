#!/bin/bash

expresion_regular="^[+-]?[0-9]+([.][0-9]+)?$"

while true
do
    clear
    echo -e "\n\t\tGRADOS CELSIUS A GRADOS FAHRENHEIT"
    echo -e "\t\t----------------------------------\n"
    echo -en "\tIngrese los grados Celsius: " && read celsius

    if ! [[ $celsius =~ $expresion_regular ]]; then
        echo -en "\n\t$celsius no es una temperatura válida " && read -s tecla
        continue
    fi

    fahrenheit=$(echo "scale=2; (((9/5)*$celsius)+32)/1" | bc -l)
    echo -e "\n\t$celsius grados Celsius -> $fahrenheit grados Fahrenheit"
    break
done
