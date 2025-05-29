#!/bin/bash

while true; do
    echo "Selecciona una opción:"
    echo "1) Mostrar la fecha y hora actual"
    echo "2) Comprobar si un archivo existe"
    echo "3) Salir"
    read -p "Introduce tu elección: " opcion

    case $opcion in
        1)
            echo "Fecha y hora actual: $(date)"
            ;;
        2)
            read -p "Introduce la ruta del archivo: " archivo
            if [[ -e "$archivo" ]]; then
                echo "El archivo existe."
            else
                echo "El archivo no existe."
            fi
            ;;
        3)
            echo "Saliendo del menú. ¡Hasta luego!"
            break
            ;;
        *)
            echo "Opción no válida. Por favor, introduce una opción válida (1, 2 o 3)."
            ;;
    esac
done
