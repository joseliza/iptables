#!/bin/bash
# Cambiamos puerta de enlace en host1 y host2 hacia la interfaz del router
docker exec host1 ip route del default
docker exec host1 ip route add default via 172.18.0.3
docker exec host2 ip route del default 
docker exec host2 ip route add default via 172.19.0.3
