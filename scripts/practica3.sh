#!/bin/bash

clear
echo -e "\n\tCALCULAR DESCUENTO"
echo -ne "\n\tIngrese el precio: "
read precio_inicial
echo -e "\n\tEl precio con descuento es `echo "$precio_inicial*0.85" | bc -l`"

