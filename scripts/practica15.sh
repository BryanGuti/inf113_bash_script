#!/bin/bash

expresion_regular="^[1-9][0-9]*$"
a=0
b=1

while true
do
	clear
	echo -e "\n\t\tSERIE DE FIBONACCI"
	echo -e "\t\t------------------\n"

	echo -en "\t\tIngrese la cantidad de terminos que quiere imprimir: "
	read terminos

	if ! [[ $terminos =~ $expresion_regular ]]; then
		echo -en "\n\t\t$terminos no es una cantidad válida " && read -s tecla
		continue
	fi

	echo -en "\n\t\t"

	for (( i=0;i<terminos;i++ ))
	do
		aux=$a
		a=$b
		b=$(($aux+$b))

		echo -n "$a  "
	done

	read -s tecla && echo
	break
done
