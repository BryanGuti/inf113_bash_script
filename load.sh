#!/bin/bash

file="practica.md"
scripts_directory="scripts"
quantity_of_files=$(($(ls -l $scripts_directory | wc -l)-1))

echo "# Práctica en laboratorio" > $file
echo "" >> $file

for exercise in `seq $quantity_of_files`
do
    echo "***" >> $file
    echo "" >> $file
    echo "### *Práctica $exercise*" >> $file
    echo "" >> $file
    echo "Archivo: practica$exercise.sh" >> $file
    echo "" >> $file
    echo -e "\`\`\`bash" >> $file
    cat "$scripts_directory/practica$exercise.sh" >> $file
    echo "" >> $file
    echo -e "\`\`\`" >> $file
    echo "" >> $file
done

