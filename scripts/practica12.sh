#!/bin/bash

f() {
	echo "scale=2; $1 * $2" | bc -l
}

clear
echo -en "\n\tIngrese el valor de x: "
read x
echo -en "\n\tIngrese el valor de y: "
read y
echo -e "\n\tEl resultado de la funcion f(x,y)=xy es: $(f $x $y)"
