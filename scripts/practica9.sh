#!/bin/bash

expresion_regular="^[0-9]+$"

obtener_factorial(){
	if (( $1 <= 1 )); then
		echo 1
	else
		echo "$1*$(obtener_factorial $(($1 - 1)))" | bc
	fi
}

while true
do
	clear
	echo -e "\n\t\tCALCULADORA DEL FACTORIAL DE UN NUMERO"
	echo -e "\t\t--------------------------------------\n"
	echo -en "\t\tIngrese un numero: " && read numero

	if ! [[ $numero =~ $expresion_regular ]]; then
		echo -en "\n\t\tIngresa un numero entero positivo o 0 "
		read -s tecla
		continue
	fi

	factorial=$(obtener_factorial $numero)
	echo -e "\n\t\tEl factorial de $numero es: $factorial"
	break
done
