#!/bin/bash

clear
echo -e "\n\t\tCALCULADORA DE SALARIO"
echo -e "\t\t----------------------\n"
echo -en "\t\tIngrese las horas trabajadas: " && read horas
echo -en "\n\t\tIngrese el valor (Bs) por hora: " && read valor_hora
salario=$(echo "scale=2; $horas*$valor_hora" | bc -l)
echo -e "\n\t\tEl salario a pagar es: $salario Bs."
