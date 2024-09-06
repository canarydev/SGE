# Instalación del SGE

## ¡Nuevo! Instalar utilizando script (Sólo LINUX)
```
curl -fsSL https://github.com/canarydev/SGE/blob/main/assets/src/instalador.sh | sudo sh
```

## Instalar Docker (Windows)
[Descarga Docker](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe) e instálalo.

## Instalar Portainer
```
docker volume create portainer_data
```
```
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```

## Instalar PostgreSQL
```
docker run -d -p 5432:5432 -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres:latest
```

## Instalar pgAdmin4
```
docker run --name pgadmin4 -p 80:80 -e "PGADMIN_DEFAULT_EMAIL=YOUR_MAIL" -e "PGADMIN_DEFAULT_PASSWORD=YOUR_PASS" --link db:db -d dpage/pgadmin4
```
> ⚠️**CUIDADO**: Debes poner un email válido y una contraseña en el comando anterior.

## Crear los volúmenes de Docker
```
docker volume create odoo
```
```
docker volume create extra-addons
```

## Instalar odoo16 (arm64)
```
docker run -d -v odoo:/var/lib/odoo -v extra-addons:/mnt/extra-addons -p 8069:8069 --name odoo16 --link db:db -t canarydev/odoo-arm64:16
```

## Instalar odoo16 (x64)
```
docker run -d -v odoo:/var/lib/odoo -v extra-addons:/mnt/extra-addons -p 8069:8069 --name odoo16 --link db:db -t odoo:16
```

## ⚠️ Si tienes problemas al instalar Docker ⚠️...
Es probable que el problema se deba a Windows Subsystem for Linux. Descarga [WSL Update](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi) e instálalo, debería dar resultado.

En caso de usar una máquina de arquitectura arm64, descarga [WSL Update para arm64](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_arm64.msi).
