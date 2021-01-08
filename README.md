# Uso de la imagen alpine-iptables

Para ejecutar un contenedor basado en esta imagen se debe hacer con el parámetro --cap-add=NET_ADMIN[¹] :

```bash
# docker run --cap-add=NET_ADMIN -it alpine-iptables
```
o, si queremos que el contenedor se ejecute en segundo plano y se elimite cuando se salga de él:
```bash
# docker run --cap-add=NET_ADMIN -dit --rm --name contenedor1 alpine-iptables
```

[¹]: <https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities>

