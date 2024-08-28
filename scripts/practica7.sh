#!/bin/bash
er_horas="^[0-9]+$"
er_dinero="^[0-9]+([.][0-9]+)?$"

clear
echo -e "\n\t\tCALCULADORA DE SALARIO"
echo -e "\t\t----------------------\n"

while true
do
    echo -en "\n\tIngrese las horas trabajadas: " && read horas
    if [[ $horas =~ $er_horas ]]; then
        break
    fi
    echo -en "\n\t$horas no es un formato válido de horas "
    read -s tecla && echo
done

while true
do
    echo -en "\n\tIngrese el valor (Bs) por hora: " && read dinero
    if [[ $dinero =~ $er_dinero ]]; then
        break
    fi
    echo -en "\n\t$dinero no es un formato válido de dinero "
    read -s tecla && echo
done

salario=$(echo "scale=2; ($horas*$dinero)/1" | bc -l)
echo -e "\n\tEl salario a pagar es: $salario Bs."
