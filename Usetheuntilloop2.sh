#!/bin/bash/

es_entero() {
    [[ $1 =~ ^-?[0-9]+$ ]]
}

declare -a numeros=()

until [[ ${#numeros[@]} -eq 3 ]]; do
    echo "Introduce un numero:"
    read entrada
    if es_entero "$entrada"; then
        numeros+=("$entrada")
    else
        echo "Entrada erronea, introduce un número entero válido."
    fi
done

suma=0
producto=1
for num in "${numeros[@]}"; do
    suma=$((suma + num))
    producto=$((producto * num))
done

mayor=${numeros[0]}
menor=${numeros[0]}

for num in "${numeros[@]}"; do
    if ((num > mayor)); then
        mayor=$num
    fi
    if ((num < menor)); then
        menor=$num
    fi
done

echo "Suma: $suma"
echo "Producto: $producto"
echo "Mayor: $mayor"
echo "Menor: $menor"

