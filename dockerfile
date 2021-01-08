# Ejecutarlo con el parámetro --cap-add=NET_ADMIN para poder ejecutar iptables
# docker run --cap-add=NET_ADMIN -it alpine-iptables

FROM alpine

RUN apk update \
&& apk add iptables \
&& apk add nano
