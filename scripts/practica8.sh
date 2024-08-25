#!/bin/bash

clear
echo -e "\n\t\tCALCULADORA DE SEGUNDOS"
echo -e "\t\t-----------------------\n"
echo -en "\t\tIngrese la cantidad de horas: " && read horas
echo -en "\t\tIngrese la cantidad de minutos: " && read minutos
echo -en "\t\tIngrese la cantidad de segundos: " && read segundos
segundos_totales=$(echo "($horas*3600)+($minutos*60)+$segundos" | bc)
echo -e "\n\t\t$horas horas + $minutos minutos + $segundos segundos => $segundos_totales segundos"
