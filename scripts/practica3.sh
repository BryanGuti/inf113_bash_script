#!/bin/bash

expresion_regular="^[0-9]+([.][0-9]+)?$"

while true
do
    clear
    echo -e "\n\t\tCALCULAR DESCUENTO"
    echo -e "\t\t------------------\n"
    echo -ne "\tIngrese el precio: " && read precio_inicial
    if ! [[ $precio_inicial =~ $expresion_regular ]]; then
        echo -en "\n\t$precio_inicial no es un precio valido " && read -s tecla
        continue
    fi
    precio_final=$(echo "scale=2; ($precio_inicial*0.85)/1" | bc -l)
    echo -en "\n\tEl precio con descuento es $precio_final "
    read -s tecla
    echo
    break
done
