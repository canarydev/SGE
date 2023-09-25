# Instalación del SGE

## Instalar Docker-Compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/v2.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Instalar Portainer
```
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```

## Instalar PostgreSQL y pgAdmin4
```
docker run -d -p 5432:5432 -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres:latest
docker run --name pgadmin4 -p 80:80 -e "PGADMIN_DEFAULT_EMAIL=YOUR_MAIL" -e "PGADMIN_DEFAULT_PASSWORD=YOUR_PASS" --link db:db -d dpage/pgadmin4
```

## Crear los volúmenes de Docker
```
docker volume create odoo
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
