#!/bin/bash

continuar=true
x=0
y=0

leer_numeros(){
	echo -en "\n\tIngrese el valor del primer numero: " && read x
	echo -en "\n\tIngrese el valor del segundo numero: " && read y
}

while $continuar
do
	clear
	echo -e "\n\t\tOPERACIONES CON DOS NUMEROS"
	echo -e "\t\t---------------------------\n"
	echo -e "\t1) Suma"
	echo -e "\t2) Resta"
	echo -e "\t3) Multiplicacion"
	echo -e "\t4) Division"
	echo -e "\t5) Modulo"
	echo -e "\t0) Salir"

	echo -en "\n\tSeleciona la operacion que deseas realizar: "
	read operacion

	case $operacion in
	1)	leer_numeros
		echo -e "\n\tLa suma es: `echo "scale=2; $x+$y" | bc -l`"
	;;
	2)	leer_numeros
		echo -e "\n\tLa resta es: `echo "scale=2; $x-$y" | bc -l`"
	;;
	3)	leer_numeros
		echo -e "\n\tLa multiplicacion es: `echo "scale=2; $x*$y" | bc -l`"
	;;
	4)	leer_numeros
		echo -e "\n\tLa division es: `echo "scale=2; $x/$y" | bc -l`"
	;;
	5)	leer_numeros
		echo -e "\n\tEl modulo es: `echo "scale=2; $x%$y" | bc -l`"
	;;
	0)	echo -e "\n\tFIN DEL PROGRAMA..."
		continuar=false
	;;
	*)	echo -e "\n\t$operacion no es una opcion valida"
	;;
	esac

	read tecla
done

