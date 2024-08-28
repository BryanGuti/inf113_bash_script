#!/bin/bash

expresion_regular="^[+-]?[0-9]+$"
x=0
y=0

leer_numeros(){
	# Leer x
	while true
	do
		echo -en "\n\t\tIngrese el primer numero: " && read numero
		if [[ $numero =~ $expresion_regular ]]; then
			x=$numero
			break
		fi
		echo -en "\n\t\t$numero no es un numero valido "
		read -s tecla && echo
	done

	# Leer y
	while true
	do
		echo -en "\n\t\tIngrese el segundo numero: " && read numero
		if [[ $numero =~ $expresion_regular ]]; then
			y=$numero
			break
		fi
		echo -en "\n\t\t$numero no es un numero valido "
		read -s tecla && echo
	done
}

while true
do
	clear
	echo -e "\n\t\tOPERACIONES CON DOS NUMEROS"
	echo -e "\t\t---------------------------\n"
	echo -e "\t1) Suma"
	echo -e "\t2) Resta"
	echo -e "\t3) Multiplicación"
	echo -e "\t4) División"
	echo -e "\t5) Módulo"
	echo -e "\t0) Salir"

	echo -en "\n\tSeleciona la operación que deseas realizar: "
	read operacion

	case $operacion in
	1)	leer_numeros
		echo -e "\n\tLa suma es: `echo "$x+$y" | bc`"
	;;
	2)	leer_numeros
		echo -e "\n\tLa resta es: `echo "$x-$y" | bc`"
	;;
	3)	leer_numeros
		echo -e "\n\tLa multiplicación es: `echo "$x*$y" | bc`"
	;;
	4)	leer_numeros
		echo -e "\n\tLa división es: `echo "scale=2; $x/$y" | bc -l`"
	;;
	5)	leer_numeros
		echo -e "\n\tEl módulo es: `echo "$x%$y" | bc`"
	;;
	0)	echo -e "\n\tFIN DEL PROGRAMA..."
		break
	;;
	*)	echo -e "\n\t$operacion no es una opción válida " && read -s tecla
		continue
	;;
	esac

	read -s tecla
done
