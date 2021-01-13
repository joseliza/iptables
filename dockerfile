# USO (para obtener una imagen llamada iptables-alpine):
# docker build -t iptables-alpine .
# EJECUTAR los contenedores con el parámetro --cap-add=NET_ADMIN para poder ejecutar iptables dentro:
# docker run --cap-add=NET_ADMIN -it alpine-iptables

FROM alpine

ENV PS1='\u@\h:\w> '
RUN apk update \
&& apk add iptables \
&& apk add nano
