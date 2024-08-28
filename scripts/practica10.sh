#!/bin/bash

# Letter Grade		Percentage		GPA
# 		A			90-100%			4.0
#		B			80-89%			3.0
#		C			70-79%			2.0
#		D			60-69%			1.0
#		F			0-59%			0.0

while true
do
	clear
	echo -e "\n\t\tAVERIGUE LA NOTA DEL ESTUDIANTE"
	echo -e "\t\t-------------------------------\n"
	echo -en "\tIngrese la nota del estudiante (A, B, C, D, F): "
	read calificacion

	case $calificacion in
		A|a)	echo -en "\n\tLa calificacion es 4.0 "
		;;
		B|b)	echo -en "\n\tLa calificacion es 3.0 "
		;;
		C|c)	echo -en "\n\tLa calificacion es 2.0 "
		;;
		D|d)	echo -en "\n\tLa calificacion es 1.0 "
		;;
		F|f)	echo -en "\n\tLa calificacion es 0.0 "
		;;
		*)		echo -en "\n\t$calificacion no es una opcion valida "
				read -s tecla
				continue
		;;
	esac

	read -s tecla && echo
	break
done
