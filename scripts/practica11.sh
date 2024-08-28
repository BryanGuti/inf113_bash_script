#!/bin/bash

expresion_regular="^[+-]?[0-9]+([.][0-9]+)?$"

while true
do
	clear
	echo -e "\n\t\tCALCULADORA DE PROMEDIO"
	echo -e "\t\t-----------------------\n"
	echo -en "\t\tIngrese los numeros separados por espacio: " && read numeros
	suma=0
	numeros_sumados=true

	for numero in $numeros
	do
		if [[ $numero =~ $expresion_regular ]]; then
			suma=$(echo "scale=2; ($suma+$numero)/1" | bc -l)
			continue
		fi

		echo -en "\n\t\t$numero no es un numero valido " && read -s tecla
		suma=0
		numeros_sumados=false
		break
	done

	if [ $suma == 0 ] && [ ! $numeros_sumados ] ; then
		continue
	fi

	cantidad_numeros=$(echo $numeros | wc -w)
	promedio=$(echo "scale=2; $suma/$cantidad_numeros" | bc -l)

	echo -en "\n\t\tEl promedio es: $promedio "
	read -s tecla && echo
	break
done
