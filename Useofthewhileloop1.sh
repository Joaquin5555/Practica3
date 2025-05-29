#!/bin/bash

read -p "Introduce el n0mbre del archivo donde se guardaran las palabras: " archivo

if [[ ! -f "$archivo" ]]; then
    echo "El archivo que me dices no existe. Se creará uno nuevo llamado '$archivo'."
    touch "$archivo" || { echo "Error al crear el archivo."; exit 1; }
fi

echo "Escribe las palabras que quieras (una por línea). Escribe ':>' para terminar."

while true; do
    read -p "> " palabra
    if [[ "$palabra" == ":>" ]]; then
        echo "Finalizando entrada. Las palabras se han guardado en '$archivo'."
        break
    fi
    echo "$palabra" >> "$archivo"
done
