#!/bin/bash

read -p "Introduce la ruta del directorio: " dir

if [[ ! -d "$dir" ]]; then
    echo "Error: '$dir' no es un directorio válido."
    exit 1
fi

echo
echo "Información del directorio: $dir"
echo "-------------------------------"

permisos=$(ls -ld "$dir" | awk '{print $1}')
echo "Permisos: $permisos"

num_archivos=$(find "$dir" -maxdepth 1 -type f | wc -l)
num_subdirs=$(find "$dir" -maxdepth 1 -type d | wc -l)
num_subdirs=$((num_subdirs - 1))

echo "Cantidad de archivos: $num_archivos"
echo "Cantidad de subdirectorios: $num_subdirs"

echo
echo "Contenido:"
ls -1 "$dir"
