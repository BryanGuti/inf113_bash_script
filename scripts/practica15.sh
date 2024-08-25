#!/bin/bash

clear
echo -e "\n\t\tSERIE DE FIBONACCI"
echo -en "\n\tIngrese la cantidad de terminos que quiere imprimir: "
read terminos

a=0
b=1

echo -en "\n\t"

for (( i=0;i<terminos;i++ ))
do
	aux=$a
	a=$b
	b=$(($aux+$b))

	echo -n "$a  "
done

echo

