# Instalación del SGE

En esta unidad aprenderás a instalar Odoo utilizando Docker, tanto en para Windows, como Linux.




sudo docker run -d -v /mnt/extra-addons:/mnt/extra-addons -p 8069:8069 --name odoo20 -l db:db -t odoo:20 --http-interface=0.0.0.0 --http-port=8069
