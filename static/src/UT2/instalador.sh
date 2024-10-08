#!/bin/bash

# Comprobar si el script se está ejecutando como root
        if [ "$(id -u)" -ne 0 ]; then
        echo "Este script debe ejecutarse como root. Por favor, utiliza 'sudo' o inicia sesión como root."
        exit 1
        fi
        
# Instalar guest additions
        instalar_guest_additions() {
            echo "Instalando Guest Additions..."
            /media/$SUDO_USER/VBox_GAs_7.0.12/VBoxLinuxAdditions.run
            echo "Guest Additions instaladas con éxito."
        }
        
        # Preguntar al usuario si desea instalar las Guest Additions, con respuesta por defecto 'no'
        read -p "¿Desea instalar las Guest Additions? (Debes tener el cd virtual introducido) [s/N]: " respuesta
        respuesta=${respuesta:-N}  # Si el usuario no ingresa nada, la respuesta por defecto es 'N'
        
        # Convertir a minúsculas para evitar problemas de comparación
        respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')
        
        if [[ "$respuesta" == "s" || "$respuesta" == "sí" || "$respuesta" == "si" || "$respuesta" == "y" || "$respuesta" == "yes" ]]; then
            instalar_guest_additions
        else
            echo "No se instalarán las Guest Additions."
        fi
        

# Instalar docker
        apt update
        sleep 1
        apt install ca-certificates curl -y
        install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sleep 1
        chmod a+r /etc/apt/keyrings/docker.asc
        sleep 1
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
        sleep 1
        apt update
        apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Instalar portainer
        docker volume create portainer_data
        docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
        sleep 4
        docker restart portainer

# Instalar postgresql
        docker run -d -p 5432:5432 -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres:latest

# Instalar pgAdmin4
        # Función para validar correo electrónico
        function validar_email() {
        local email_regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
        if [[ $1 =~ $email_regex ]]; then
                return 0  # Válido
        else
                return 1  # No válido
        fi
        }

        # Solicitar el correo electrónico al usuario y validarlo
        while true; do
        read -p "Por favor, ingresa tu correo electrónico: " email

        if validar_email "$email"; then
                echo "Correo electrónico válido."
                break
        else
                echo "Correo electrónico no válido. Inténtalo de nuevo."
        fi
        done

        # Solicitar la contraseña al usuario dos veces y comprobar si coinciden
        while true; do
        read -sp "Por favor, ingresa tu contraseña: " password
        echo
        read -sp "Por favor, confirma tu contraseña: " password_confirm
        echo

        if [ "$password" == "$password_confirm" ]; then
                echo "Las contraseñas coinciden."
                break
        else
                echo "Las contraseñas no coinciden. Inténtalo de nuevo."
        fi
        done
        
        docker run --name pgadmin4 -p 80:80 -e "PGADMIN_DEFAULT_EMAIL=$email" -e "PGADMIN_DEFAULT_PASSWORD=$password" --link db:db -d dpage/pgadmin4:latest

# Instalar Odoo
        docker volume create odoo
        docker volume create extra-addons

        # Establecer la versión predeterminada de Odoo (última versión conocida)
        VERSION_POR_DEFECTO="latest"

        # Función para validar la entrada de la versión
        function validar_version() {
        local version_regex="^[0-9]{2}$"
        if [[ $1 =~ $version_regex || $1 == "latest" ]]; then
                return 0  # Válida
        else
                return 1  # No válida
        fi
        }

        # Solicitar la versión de Odoo al usuario
        read -p "Por favor, ingresa la versión de Odoo que deseas (por ejemplo, 16). Presiona Enter para la última versión ($VERSION_POR_DEFECTO): " odoo_version

        # Verificar la entrada del usuario
        if [ -z "$odoo_version" ]; then
        # Si no se ingresa nada, usar la versión predeterminada
        odoo_version=$VERSION_POR_DEFECTO
        echo "No se ingresó ninguna versión. Se utilizará la última versión: Odoo $odoo_version."
        elif validar_version "$odoo_version"; then
        # Si la entrada es válida, usar la versión ingresada
        echo "Versión de Odoo seleccionada: $odoo_version."
        else
        # Si la entrada no es válida, mostrar un mensaje de error
        echo "Entrada no válida. Por favor, ingresa solo dos dígitos numéricos para la versión de Odoo."
        exit 1
        fi

        docker run -d -v odoo:/var/lib/odoo -v extra-addons:/mnt/extra-addons -p 8069:8069 --name odoo --link db:db -t odoo:$odoo_version

# Eliminar la BD creada por defecto en Odoo
        DB_NAME="odoo"
        DB_USER="odoo"
        DB_HOST="localhost"
        DB_PORT="5432"
        
        # Eliminar la base de datos
        echo "Eliminando la base de datos $DB_NAME..."
        
        psql -h $DB_HOST -U $DB_USER -p $DB_PORT -c "DROP DATABASE IF EXISTS $DB_NAME;"
        
        if [ $? -eq 0 ]; then
            echo "La base de datos $DB_NAME fue eliminada con éxito."
        else
            echo "Hubo un problema al eliminar la base de datos $DB_NAME."
        fi

# Instalar VScode
        apt install wget gpg -y
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
        rm -f packages.microsoft.gpg
        apt install apt-transport-https -y
        apt update
        apt install code
        usermod -aG docker ${SUDO_USER} # Añadir al usuario al grupo docker para poder utilizar la extensión docker en VScode

  # Instalar las extensiones VScode
        code --install-extension ms-azuretools.vscode-docker
        code --install-extension ms-python.python
        code --install-extension ms-vscode-remote.remote-containers
        code --install-extension mechatroner.raincsv

# Actualizar todo
        apt update
        apt upgrade -y                     
