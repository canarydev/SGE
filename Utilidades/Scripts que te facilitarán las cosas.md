Aquí encontrarás algunos scripts que te pueden facilitar el uso de docker:

### Abrir la terminal de un contenedor

Para abrir la terminal de un contenedor debemos usar `docker exec -it -u 0 <contenedor> bash`.

En ocasiones puede ser lioso o puedes no acordarte del comando. Si ejecutas el código que está debajo en tu máquina anfitriona crearás un nuevo comando llamado `bash-container <container>` que te permitirá acceder mucho más rápido al contenedor.

```bash
sudo curl -o /usr/local/sbin/bash-container https://raw.githubusercontent.com/canarydev/SGE/refs/heads/main/static/src/utilities/bash-container.sh && \
sudo chmod +x /usr/local/sbin/bash-container
```

### Ver el log del contenedor

Para abrir un log de un contenedor se utiliza `docker logs -f <contenedor>`, pero si ejecutas el siguiente comando, podrás hacerlo con el comando `logs-container <container>`

```bash
sudo curl -o /usr/local/sbin/logs-container https://raw.githubusercontent.com/canarydev/SGE/refs/heads/main/static/src/utilities/logs-container.sh  &&\
sudo chmod +x /usr/local/sbin/logs-container
```
