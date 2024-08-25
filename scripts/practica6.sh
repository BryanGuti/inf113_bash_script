#!/bin/bash

echo -e "\n\t\tGRADOS CELSIUS A GRADOS FAHRENHEIT"
echo -e "\t\t----------------------------------\n"
echo -en "\tIngrese los grados Celsius: " && read celsius
fahrenheit=$(echo "scale=2; ((9/5)*$celsius)+32" | bc -l)
echo -e "\n\t$celsius grados Celsius -> $fahrenheit grados Fahrenheit"
