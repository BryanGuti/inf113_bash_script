#!/bin/bash

obtener_factorial(){
	if (( $1 <= 1 )); then
		echo 1
	else
		echo "$1*$(obtener_factorial $(($1 - 1)))" | bc
	fi
}

numero=-1

while [ $numero -lt 0 ]
do
	clear
	echo -e "\n\t\tCALCULADORA DEL FACTORIAL DE UN NUMERO"
	echo -e "\t\t--------------------------------------\n"
	echo -en "\t\tIngrese un numero: " && read numero

	if (( $numero <= 0 )); then
		echo -e "\n\t\tIngresa un numero mayor o igual que cero"
		numero=-1
		read tecla
		continue
	fi

	factorial=$(obtener_factorial $numero)
	echo -e "\n\t\tEl factorial de $numero es: $factorial"
done
