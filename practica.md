# Práctica en laboratorio

***

### *Práctica 1*

Archivo: practica1.sh

```bash
#!/bin/bash

mkdir idiomas turismo
touch idiomas/{nombres,notas}.txt
cp idiomas/* turismo/
chmod go+wx turismo/*.txt
tar -czf idiomas.tar.gz idiomas/
rm -rf idiomas/
tar -xzf idiomas.tar.gz

```

***

### *Práctica 2*

Archivo: practica2.sh

```bash
#!/bin/bash

mkdir -p latex/excel
touch latex/excel/planilla.txt
echo "Fabiola:2500:Sopocachi #1234" >> latex/excel/planilla.txt
echo "Monica:3600:Landaeta #456" >> latex/excel/planilla.txt
echo "Juan:3500:Landaeta #787" >> latex/excel/planilla.txt
echo "Pedro:5800:Achumani #454" >> latex/excel/planilla.txt
grep -i "landaeta" latex/excel/planilla.txt > latex/excel/direccion.sav
cat latex/excel/direccion.sav

```

***

### *Práctica 3*

Archivo: practica3.sh

```bash
#!/bin/bash

expresion_regular="^[0-9]+([.][0-9]+)?$"

while true
do
    clear
    echo -e "\n\t\tCALCULAR DESCUENTO"
    echo -e "\t\t------------------\n"
    echo -ne "\tIngrese el precio: " && read precio_inicial
    if ! [[ $precio_inicial =~ $expresion_regular ]]; then
        echo -en "\n\t$precio_inicial no es un precio valido " && read -s tecla
        continue
    fi
    precio_final=$(echo "scale=2; ($precio_inicial*0.85)/1" | bc -l)
    echo -en "\n\tEl precio con descuento es $precio_final "
    read -s tecla
    echo
    break
done

```

***

### *Práctica 4*

Archivo: practica4.sh

```bash
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

```

***

### *Práctica 5*

Archivo: practica5.sh

```bash
#!/bin/bash

expresion_regular="^[0-9]+([.][0-9]+)?$"
PI=3.14159265359

while true
do
    clear
    echo -e "\n\tCALCULAR VOLUMEN Y AREA DE UNA ESFERA"
    echo -e "\t-------------------------------------\n"
    echo -en "\tIngrese el radio de la esfera: " && read radio

    if ! [[ $radio =~ $expresion_regular ]]; then
        echo -en "\n\t$radio no es un número válido " && read -s tecla
        continue
    fi

    volumen=$(echo "scale=2; (4*$PI*($radio^3))/3" | bc -l)
    area=$(echo "scale=2; (4*$PI*($radio^2))/1" | bc -l)
    echo -e "\n\t\tVOLUMEN: $volumen"
    echo -e "\n\t\tAREA: $area"
    break
done

```

***

### *Práctica 6*

Archivo: practica6.sh

```bash
#!/bin/bash

expresion_regular="^[+-]?[0-9]+([.][0-9]+)?$"

while true
do
    clear
    echo -e "\n\t\tGRADOS CELSIUS A GRADOS FAHRENHEIT"
    echo -e "\t\t----------------------------------\n"
    echo -en "\tIngrese los grados Celsius: " && read celsius

    if ! [[ $celsius =~ $expresion_regular ]]; then
        echo -en "\n\t$celsius no es una temperatura válida " && read -s tecla
        continue
    fi

    fahrenheit=$(echo "scale=2; (((9/5)*$celsius)+32)/1" | bc -l)
    echo -e "\n\t$celsius grados Celsius -> $fahrenheit grados Fahrenheit"
    break
done

```

***

### *Práctica 7*

Archivo: practica7.sh

```bash
#!/bin/bash
er_horas="^[0-9]+$"
er_dinero="^[0-9]+([.][0-9]+)?$"

clear
echo -e "\n\t\tCALCULADORA DE SALARIO"
echo -e "\t\t----------------------\n"

while true
do
    echo -en "\n\tIngrese las horas trabajadas: " && read horas
    if [[ $horas =~ $er_horas ]]; then
        break
    fi
    echo -en "\n\t$horas no es un formato válido de horas "
    read -s tecla && echo
done

while true
do
    echo -en "\n\tIngrese el valor (Bs) por hora: " && read dinero
    if [[ $dinero =~ $er_dinero ]]; then
        break
    fi
    echo -en "\n\t$dinero no es un formato válido de dinero "
    read -s tecla && echo
done

salario=$(echo "scale=2; ($horas*$dinero)/1" | bc -l)
echo -e "\n\tEl salario a pagar es: $salario Bs."

```

***

### *Práctica 8*

Archivo: practica8.sh

```bash
#!/bin/bash

expresion_regular="^[0-9]+$"

clear
echo -e "\n\t\tCALCULADORA DE SEGUNDOS"
echo -e "\t\t-----------------------\n"

while true
do
    echo -en "\n\t\tIngrese la cantidad de horas: " && read horas
    if [[ $horas =~ $expresion_regular ]]; then
        break
    fi
    echo -en "\n\t\t$horas no es una cantidad válida "
    read -s tecla && echo
done

while true
do
    echo -en "\n\t\tIngrese la cantidad de minutos: " && read minutos
    if [[ $minutos =~ $expresion_regular ]]; then
        break
    fi
    echo -en "\n\t\t$minutos no es una cantidad válida "
    read -s tecla && echo
done

while true
do
    echo -en "\n\t\tIngrese la cantidad de segundos: " && read segundos
    if [[ $segundos =~ $expresion_regular ]]; then
        break
    fi
    echo -en "\n\t\t$segundos no es una cantidad válida "
    read -s tecla && echo
done

segundos_totales=$(echo "($horas*3600)+($minutos*60)+$segundos" | bc)
echo -e "\n\t\t$horas hrs + $minutos min + $segundos seg => $segundos_totales seg"

```

***

### *Práctica 9*

Archivo: practica9.sh

```bash
#!/bin/bash

expresion_regular="^[0-9]+$"

obtener_factorial(){
	if (( $1 <= 1 )); then
		echo 1
	else
		echo "$1*$(obtener_factorial $(($1 - 1)))" | bc
	fi
}

while true
do
	clear
	echo -e "\n\t\tCALCULADORA DEL FACTORIAL DE UN NUMERO"
	echo -e "\t\t--------------------------------------\n"
	echo -en "\t\tIngrese un numero: " && read numero

	if ! [[ $numero =~ $expresion_regular ]]; then
		echo -en "\n\t\tIngresa un numero entero positivo o 0 "
		read -s tecla
		continue
	fi

	factorial=$(obtener_factorial $numero)
	echo -e "\n\t\tEl factorial de $numero es: $factorial"
	break
done

```

***

### *Práctica 10*

Archivo: practica10.sh

```bash
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

```

***

### *Práctica 11*

Archivo: practica11.sh

```bash
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

```

***

### *Práctica 12*

Archivo: practica12.sh

```bash
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

```

***

### *Práctica 13*

Archivo: practica13.sh

```bash
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

```

***

### *Práctica 14*

Archivo: practica14.sh

```bash
#!/bin/bash

GREEN="\u001b[32m"
RED="\u001b[31m"
WHITE="\u001b[37m"

expresion_regular="^[1-9][0-9]*$"

while true
do
    clear
    echo -e "\n\t\tAVERIGUE SI UN NUMERO ES PRIMO"
    echo -e "\t\t------------------------------\n"
    echo -en "\t\tIngrese un numero: " && read numero

    if ! [[ $numero =~ $expresion_regular ]]; then
        echo -en "\n\t\t$numero no es un numero válido " && read -s tecla
        continue
    fi

    if [[ $numero == 1 ]]; then
        echo -en "$RED\n\t\t$numero no es un numero primo $WHITE"
        read -s tecla && echo
        break
    fi

    for (( i=2; i <= $numero; i++ ))
    do
        if [[ $(($numero % $i)) > 0 ]]; then
            continue
        fi

        if (( ($(($numero % $i)) == 0) && ($i < $numero) )); then
            echo -en "$RED\n\t\t$numero no es un numero primo $WHITE"
            read -s tecla && echo
            break
        fi

        echo -en "$GREEN\n\t\t$numero es un numero primo $WHITE"
        read -s tecla && echo
    done

    break
done

```

***

### *Práctica 15*

Archivo: practica15.sh

```bash
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

```

