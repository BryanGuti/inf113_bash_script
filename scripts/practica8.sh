#!/bin/bash

expresion_regular="^[0-9]+$"

clear
echo -e "\n\t\tCALCULADORA DE SEGUNDOS"
echo -e "\t\t-----------------------\n"

while true
do
    echo -en "\n\t\tIngrese la cantidad de horas: " && read horas
    if [[ $horas =~ $expresion_regular ]]; then
        break
    fi
    echo -en "\n\t\t$horas no es una cantidad válida "
    read -s tecla && echo
done

while true
do
    echo -en "\n\t\tIngrese la cantidad de minutos: " && read minutos
    if [[ $minutos =~ $expresion_regular ]]; then
        break
    fi
    echo -en "\n\t\t$minutos no es una cantidad válida "
    read -s tecla && echo
done

while true
do
    echo -en "\n\t\tIngrese la cantidad de segundos: " && read segundos
    if [[ $segundos =~ $expresion_regular ]]; then
        break
    fi
    echo -en "\n\t\t$segundos no es una cantidad válida "
    read -s tecla && echo
done

segundos_totales=$(echo "($horas*3600)+($minutos*60)+$segundos" | bc)
echo -e "\n\t\t$horas hrs + $minutos min + $segundos seg => $segundos_totales seg"
