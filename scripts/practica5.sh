#!/bin/bash

expresion_regular="^[0-9]+([.][0-9]+)?$"
PI=3.14159265359

while true
do
    clear
    echo -e "\n\tCALCULAR VOLUMEN Y AREA DE UNA ESFERA"
    echo -e "\t-------------------------------------\n"
    echo -en "\tIngrese el radio de la esfera: " && read radio

    if ! [[ $radio =~ $expresion_regular ]]; then
        echo -en "\n\t$radio no es un número válido " && read -s tecla
        continue
    fi

    volumen=$(echo "scale=2; (4*$PI*($radio^3))/3" | bc -l)
    area=$(echo "scale=2; (4*$PI*($radio^2))/1" | bc -l)
    echo -e "\n\t\tVOLUMEN: $volumen"
    echo -e "\n\t\tAREA: $area"
    break
done
