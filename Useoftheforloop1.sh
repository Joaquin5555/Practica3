#!/bin/bash

read -p "Introduce el nombre del archivo que quieres procesar: " archivo

if [[ ! -f "$archivo" ]]; then
    echo "El archivo no existe."
    exit 1
fi

archivo_sin_comentarios="sin_comentarios.tmp"
grep -v '^\s*#' "$archivo" | sed 's/#.*//' > "$archivo_sin_comentarios"

echo "Comentarios eliminados. Archivo procesado: $archivo_sin_comentarios"

read -p "Introduce una palabra o frase para buscar en el archivo: " frase

if grep -q "$frase" "$archivo_sin_comentarios"; then
    echo "La palabra/frase '$frase' SÍ se encuentra en el archivo."
else
    echo "La palabra/frase '$frase' NO la puedo encontrar en el archivo."
fi

while true; do
    read -p "Introduce una frase para añadir al final del archivo (obligatorio): " nueva_frase
    if [[ -n "$nueva_frase" ]]; then
        echo "$nueva_frase" >> "$archivo_sin_comentarios"
        echo "Frase añadida correctamente."
        break
    else
        echo "No puedes dejarlo vacío. Inténtalo de nuevo."
    fi
done

echo "Proceso finalizado. Archivo actualizado: $archivo_sin_comentarios"
#holas
