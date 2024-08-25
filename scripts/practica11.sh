#!/bin/bash

expresion_regular="^[+-]?[0-9]+([.][0-9]+)?$"
continuar=true

while $continuar
do
	clear
	echo -e "\n\t\tCALCULADORA DE PROMEDIO"
	echo -e "\t\t-----------------------\n"
	echo -en "\t\tIngrese los numeros separados por espacio: " && read numeros
	suma=0

	for numero in $numeros
	do
		if ! [[ $numero =~ $expresion_regular ]]; then
			echo -e "\n\t\t$numero no es un numero valido" && sleep 2
			suma=0
			break
		fi

		suma=$(echo "scale=2; $suma+$numero" | bc -l)
	done

	if [[ $suma == 0 ]]; then
		continue
	fi

	cantidad_numeros=$(echo $numeros | wc -w)
	promedio=$(echo "scale=2; $suma/$cantidad_numeros" | bc -l)

	echo -e "\n\t\tEl promedio es: $promedio"
	continuar=false
done
