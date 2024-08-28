#!/bin/bash

expresion_regular="^[+-]?[0-9]+([.][0-9]+)?$"


f() {
	echo "scale=2; $1 * $2" | bc -l
}

clear

while true
do
	echo -en "\n\n\tIngrese el valor de x: " && read x
	if [[ $x =~ $expresion_regular ]]; then
		break
	fi
	echo -en "\n\t$x no es un valor válido " && read -s tecla
done

while true
do
	echo -en "\n\n\tIngrese el valor de y: " && read y
	if [[ $y =~ $expresion_regular ]]; then
		break
	fi
	echo -en "\n\t$y no es un valor válido " && read -s tecla
done

echo -e "\n\tEl resultado de la funcion f(x,y)=xy es: $(f $x $y)"
