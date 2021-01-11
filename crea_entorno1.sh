#!/bin/bash
# Eliminamos redes y contenedores para evitar errores si ya existen
docker rm --force host1
docker rm --force host2
docker rm --force router
docker network rm red1
docker network rm red2

# Creamos redes
docker network create --driver bridge --subnet 172.18.0.0/16 --gateway 172.18.0.1 red1
docker network create --driver bridge --subnet 172.19.0.0/16 --gateway 172.19.0.1 red2

# Iniciamos contenedores
docker run -dit --rm --cap-add NET_ADMIN --name host1 --network red1 iptables-alpine
docker run -dit --rm --cap-add NET_ADMIN --name host2 --network red2 iptables-alpine
docker run -dit --rm --cap-add NET_ADMIN --name router --network red1 --volume $PWD:/home iptables-alpine

# Le añadimos al router una interfaz en la red2
docker network connect red2 router

# Cambiamos puerta de enlace en host1 y host2 hacia la interfaz del router
docker exec host1 ip route del default
docker exec host1 ip route add default via 172.18.0.3
docker exec host2 ip route del default 
docker exec host2 ip route add default via 172.19.0.3
