#!/bin/bash

mkdir -p latex/excel
touch latex/excel/planilla.txt
echo "Fabiola:2500:Sopocachi #1234" >> latex/excel/planilla.txt
echo "Monica:3600:Landaeta #456" >> latex/excel/planilla.txt
echo "Juan:3500:Landaeta #787" >> latex/excel/planilla.txt
echo "Pedro:5800:Achumani #454" >> latex/excel/planilla.txt
grep -i "landaeta" latex/excel/planilla.txt > latex/excel/direccion.sav
cat latex/excel/direccion.sav
