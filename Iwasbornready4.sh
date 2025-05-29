#!/bin/bash

SITIO_WEB_ESCUELA="https://agora.xtec.cat/ies-sabadell/"

comprobar_conexion() {
    curl -s --head "$SITIO_WEB_ESCUELA" | head -n 1 | grep "200 OK" > /dev/null
}

while ! comprobar_conexion; do
    echo "No hay conexión a Internet. Reintentando en 5 segundos..."
    sleep 5
done

echo "¡Conexión establecida! Abriendo el sitio web de la escuela..."
xdg-open "$SITIO_WEB_ESCUELA" > /dev/null 2>&1 &
