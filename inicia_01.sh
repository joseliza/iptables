#!/bin/bash
# Borramos, para evitar problemas, contenedores existentes
docker rm --force host1
docker rm --force host2
docker rm --force router

# Iniciamos contenedores (si hacemos attach, cerrar con ctrl+p ctrl+q para que no se eliminen al salir)
docker run -dit --cap-add NET_ADMIN --name host1 --hostname host1 --network red1 iptables-alpine
docker run -dit --cap-add NET_ADMIN --name host2 --hostname host2 --network red2 iptables-alpine
docker run -dit --cap-add NET_ADMIN --name router --hostname router --network red1 --volume $PWD:/home iptables-alpine

# Le añadimos al router una interfaz en la red2
docker network connect red2 router
