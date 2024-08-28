#!/bin/bash

expresion_regular="^[1-9][0-9]*$"

clear
echo -e "\n\t\tMÁXIMO COMÚN DIVISOR DE DOS NÚMEROS"
echo -e "\t\t-----------------------------------\n"

while true
do
	echo -en "\n\t\tIngrese el primer número: " && read primer_numero
	if [[ $primer_numero =~ $expresion_regular ]]; then
		break
	fi
	echo -e "\n\t\t$primer_numero no es un número válido " && read -s tecla
done

while true
do
	echo -en "\n\t\tIngrese el segundo número: " && read segundo_numero
	if [[ $segundo_numero =~ $expresion_regular ]]; then
		break
	fi
	echo -e "\n\t\t$segundo_numero no es un número válido " && read -s tecla
done

x=$primer_numero
y=$segundo_numero

while true
do
	if [[ $x -ge $y ]]; then
		residuo=$(($x%$y))
		x=$y
	else
		residuo=$(($y%$x))
	fi

	y=$residuo

	if [[ $y -eq 0 ]]; then
		mcd=$x
		break
	fi
done

echo -en "\n\t\tEl Máximo común divisor de $primer_numero y $segundo_numero es: $mcd "
read -s tecla && echo
