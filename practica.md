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
echo "Monica:3600:Landaeta: #456" >> latex/excel/planilla.txt
echo "Juan:3500:Landaeta: #787" >> latex/excel/planilla.txt
echo "Pedro:5800:Achumani: #454" >> latex/excel/planilla.txt
grep -i "landaeta" latex/excel/planilla.txt > latex/excel/direccion.sav
cat latex/excel/direccion.sav

```

***

### *Práctica 3*

Archivo: practica3.sh

```bash
#!/bin/bash

clear
echo -e "\n\tCALCULAR DESCUENTO"
echo -ne "\n\tIngrese el precio: "
read precio_inicial
echo -e "\n\tEl precio con descuento es `echo "$precio_inicial*0.85" | bc -l`"

```

***

### *Práctica 4*

Archivo: practica4.sh

```bash
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

```

***

### *Práctica 5*

Archivo: practica5.sh

```bash
#!/bin/bash

PI=3.14159265359

clear
echo -e "\n\t\tCALCULAR VOLUMEN Y AREA DE UNA ESFERA"
echo -e "\t\t-------------------------------------\n"
echo -en "\n\t\tIngrese el radio de la esfera: " && read radio
volumen=$(echo "scale=2; (4*$PI*($radio^3))/3" | bc -l)
area=$(echo "scale=2; (4*$PI*($radio^2))/1" | bc -l)
echo -e "\n\t\tVOLUMEN: $volumen"
echo -e "\n\t\tAREA: $area"
```

***

### *Práctica 6*

Archivo: practica6.sh

```bash
#!/bin/bash

echo -e "\n\t\tGRADOS CELSIUS A GRADOS FAHRENHEIT"
echo -e "\t\t----------------------------------\n"
echo -en "\tIngrese los grados Celsius: " && read celsius
fahrenheit=$(echo "scale=2; ((9/5)*$celsius)+32" | bc -l)
echo -e "\n\t$celsius grados Celsius -> $fahrenheit grados Fahrenheit"
```

***

### *Práctica 7*

Archivo: practica7.sh

```bash
#!/bin/bash

clear
echo -e "\n\t\tCALCULADORA DE SALARIO"
echo -e "\t\t----------------------\n"
echo -en "\t\tIngrese las horas trabajadas: " && read horas
echo -en "\n\t\tIngrese el valor (Bs) por hora: " && read valor_hora
salario=$(echo "scale=2; $horas*$valor_hora" | bc -l)
echo -e "\n\t\tEl salario a pagar es: $salario Bs."
```

***

### *Práctica 8*

Archivo: practica8.sh

```bash
#!/bin/bash

clear
echo -e "\n\t\tCALCULADORA DE SEGUNDOS"
echo -e "\t\t-----------------------\n"
echo -en "\t\tIngrese la cantidad de horas: " && read horas
echo -en "\t\tIngrese la cantidad de minutos: " && read minutos
echo -en "\t\tIngrese la cantidad de segundos: " && read segundos
segundos_totales=$(echo "($horas*3600)+($minutos*60)+$segundos" | bc)
echo -e "\n\t\t$horas horas + $minutos minutos + $segundos segundos => $segundos_totales segundos"
```

***

### *Práctica 9*

Archivo: practica9.sh

```bash
#!/bin/bash

obtener_factorial(){
	if (( $1 <= 1 )); then
		echo 1
	else
		echo "$1*$(obtener_factorial $(($1 - 1)))" | bc
	fi
}

numero=-1

while [ $numero -lt 0 ]
do
	clear
	echo -e "\n\t\tCALCULADORA DEL FACTORIAL DE UN NUMERO"
	echo -e "\t\t--------------------------------------\n"
	echo -en "\t\tIngrese un numero: " && read numero

	if (( $numero <= 0 )); then
		echo -e "\n\t\tIngresa un numero mayor o igual que cero"
		numero=-1
		read tecla
		continue
	fi

	factorial=$(obtener_factorial $numero)
	echo -e "\n\t\tEl factorial de $numero es: $factorial"
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

continuar=true

while $continuar
do
	clear
	echo -e "\n\t\tAVERIGUE LA NOTA DEL ESTUDIANTE"
	echo -e "\t\t-------------------------------\n"
	echo -en "\tIngrese la nota del estudiante (A, B, C, D, F): "
	read calificacion

	case $calificacion in
		A|a)	echo -e "\n\tLa calificacion es 4.0"
		;;
		B|b)	echo -e "\n\tLa calificacion es 3.0"
		;;
		C|c)	echo -e "\n\tLa calificacion es 2.0"
		;;
		D|d)	echo -e "\n\tLa calificacion es 1.0"
		;;
		F|f)	echo -e "\n\tLa calificacion es 0.0"
		;;
		*)		echo -e "\n\t$calificacion no es una opcion valida"
				read tecla
				continue
		;;
	esac
	continuar=false
done

```

***

### *Práctica 11*

Archivo: practica11.sh

```bash
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
```

***

### *Práctica 12*

Archivo: practica12.sh

```bash
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
```

***

### *Práctica 13*

Archivo: practica13.sh

```bash
```

***

### *Práctica 14*

Archivo: practica14.sh

```bash
```

***

### *Práctica 15*

Archivo: practica15.sh

```bash
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

```

