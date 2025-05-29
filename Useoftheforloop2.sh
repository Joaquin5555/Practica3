#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "No hay números. Ejemplo: ./script.sh 3 -2 0 5"
    exit 1
fi

positivos=0
negativos=0
ceros=0

for num in "$@"; do
    if [[ "$num" =~ ^-?[0-9]+$ ]]; then
        if (( num > 0 )); then
            ((positivos++))
        elif (( num < 0 )); then
            ((negativos++))
        else
            ((ceros++))
        fi
    else
        echo "'$num' no es un número válido y será ignorado."
    fi
done

echo "Cantidad de números positivos: $positivos"
echo "Cantidad de números negativos: $negativos"
echo "Cantidad de ceros: $ceros"	
