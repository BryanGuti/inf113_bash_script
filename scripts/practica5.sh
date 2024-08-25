#!/bin/bash

PI=3.14159265359

clear
echo -e "\n\t\tCALCULAR VOLUMEN Y AREA DE UNA ESFERA"
echo -e "\t\t-------------------------------------\n"
echo -en "\n\t\tIngrese el radio de la esfera: " && read radio
volumen=$(echo "scale=2; (4*$PI*($radio^3))/3" | bc -l)
area=$(echo "scale=2; (4*$PI*($radio^2))/1" | bc -l)
echo -e "\n\t\tVOLUMEN: $volumen"
echo -e "\n\t\tAREA: $area"
