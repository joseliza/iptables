#!/bin/bash
# Eliminamos redes si ya existen
docker network rm red1
docker network rm red2

# Creamos redes
docker network create --driver bridge --subnet 172.18.0.0/16 --gateway 172.18.0.1 red1
docker network create --driver bridge --subnet 172.19.0.0/16 --gateway 172.19.0.1 red2

