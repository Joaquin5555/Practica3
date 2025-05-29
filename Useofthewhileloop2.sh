#!/bin/bash

usuarios_mayus=$(awk -F: '{print $1}' /etc/passwd | grep '[A-Z]')

echo "Usuarios con letras mayúsculas en su nombre:"
echo "$usuarios_mayus"
echo

while true; do
    read -p "Introduce un nombre de usuario: " username

    if id "$username" &>/dev/null; then
        echo
        echo "Usuario válido. Información completa:"
        echo "-------------------------------------"
        getent passwd "$username"
        id "$username"
        finger "$username" 2>/dev/null || echo "Comando 'finger' no esta disponible o no ha encontrado nada."
        break
    else
        echo "El usuario '$username' que estas buscando no existe. Inténtalo de nuevo."
    fi
done
