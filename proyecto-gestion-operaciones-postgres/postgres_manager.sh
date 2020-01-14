#!/bin/bash

<< COMMENT

date +%Y%m%d  : lo que se hace con este comando es settear el formato de date a 20200112
pero en mi caso lo hare con _ para que se pueda diferenciar entre año , mes y dia +%Y_%m_%d

date +%Y_%m_%d

COMMENT

current_date=`date +%Y_%m_%d`
option=0

install_postgreSQL () {
    echo -e "\nVerificando instalación de postgres ... "
    verifyInstallPostgres=$(which psql) 
    if [[ $? -eq 0 ]] ;then # el $? me dice del ultimo comando ejecutado,  0 : se resolvio con exito
        echo -e "\n Postgres ya se encuentra instalado"
    else
        echo -e "\n"
        read -s -p "Ingrese la contraseña del sudo : " password_sudo # -s silent
        read -s -p "Ingrese la contraseña que utilizará en postgres : " password_postgres
        echo -e "\n"
        echo $password_sudo | sudo -S apt update # lo que -S es leer el output de echo y colocarlo como input al sudo --stdin
        echo $password_sudo | sudo -S apt-get -y install postgresql postgresl-contrib # -y:  yes a todas las preguntas
        # cuando ejecutados algun comando con sudo , por defecto el usuario es root y posteriormente nos pide la contraseña
        # pero esto podemos cambiarlo a otro usuario que tambien tenga los mismos privilegios que el superusuario 
        # esto se hace con el -u : sudo -u chavo /comando/de/chavo
        sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$password_postgres}';"

        # Ahora toca habiliar los servicios de postgres
        echo $password_sudo | sudo -S systemctl enable postgresql.service # activando el servicio
        echo $password_sudo | sudo -S systemctl start postgresql.service # levantando el servicio
    fi
    read -n1 -s -r -p "PRESIONE [ENTER] PARA CONTINUAR ... " # -r enter 
}

uninstall_postgreSQL () {
    echo -e "\n"
    read -s -p "Ingresa la contraseña de sudo : " password_sudo
    echo -e "\n"
    echo $password_sudo | sudo -S systemctl stop postgresql.service
    echo $password_sudo | sudo -S apt-get -y --purge remove postgresql\*
    echo $password_sudo | sudo -S rm -rf /etc/postgresql
    echo $password_sudo | sudo -S rm -rf /etc/postgresql-common
    echo $password_sudo | sudo -S rm -r /etc/postgresql-common
    echo $password_sudo | sudo -S rm -rf /var/lib/postgresql
    echo $password_sudo | sudo -S rm -r /var/lib/postgresql
    echo $password_sudo | sudo -S rm -r /etc/postgresql
    echo $password_sudo | sudo -S userdel -r postgres # eliminado el usuario
    echo $password_sudo | sudo -S groupdel postgresql # elimando el grupo

    read -n1 -s -r -p "PRESIONE [ENTER] PARA CONTINUAR ... " # -r enter 
}


create_backup () {
    verifyPostgres=$(which psql)
    if [[ $? -eq 0 ]] ;then
        echo -e "\nNo existe la base de datos postgres"
        sleep 1
        return ;;
    fi
    if [[ !( -d $1 ) ]] ;then
        echo -e "\nLa ruta del directorio $1 no existe"
        sleep 1
        return ;;
    fi
    echo -e "\n Listando las base de datos ... "
    sudo -u postgres psql -c "\l"
    read -p "Digite el nombre de la base de datos para crear el backup : " db_name
    echo -e "\n"
    
    read -s -p "Ingresa la contraseña de sudo : " password_sudo
    echo -e "\nEstableciendo permisos permisos al directorio $1 ..."
    echo $password_sudo | sudo -S chmod 755 $1 
    echo "Realizando backup ... "
    sudo -u postgres pg_dump -Fc $db_name > "$1/$db_name$current_date.bak" # comando para sacer backup en postgres
    echo "Backup realizado correctamente en la ubicacion : $1/$db_name$current_date.bak"
    echo -e "\n"
    read -n1 -s -r -p "PRESIONE [ENTER] para continuar..."
}

restore_backup (){
    verifyPostgres=$(which psql)
    if [[ $? -eq 0 ]] ;then
        echo -e "\nNo existe la base de datos postgres"
        sleep 1
        return ;;
    fi
    if [[ !( -d $1 ) ]] ;then
        echo -e "\nLa ruta del directorio $1 no existe"
        sleep 1
        return ;;
    fi
    echo "Listando respaldos"
    ls -lah $1/*.bak
    echo -e "\n"
    read -p "Ingrese el nombre del backup a restaurar : " backup_name
    if [[ !( -f "$1/$backup_name" ) ]] ;then
        echo -e "\n $1/$backup_name no existe ... "
        sleep 1
        return ;;
    fi
    echo -e "\n"
    read -p "Ingrese el nombre de la base de datos destino " db_path

    # verificando que la base de datos de destino exista $db_path
    # -lqt : listar base de datos , quitar las cabeceras HEADERS
    verify_db=$(sudo -u postgres -lqt | cut -d \| -f 1 | grep -wq $db_path) # cut ... en una sola fila
    if [[ $? -eq 0 ]]; then
        echo -e "\nRestaurando en la base de datos destino: $db_path"
    else
        sudo -u postgres psql -c "CREATE DATABASE $db_path"
    fi
    echo "Restaurando backup ... "

    sudo -u postgres pg_restore -Fc -d $db_path "$1/$backup_name"

    echo "Listar la base de datos"
    sudo -u postgres psql -c "\l"
    read -n 1 -s -r -p "PRESIONE [ENTER] para continuar..."
}


while :
do
    clear
    #Desplegar el menú de opciones
    echo "_________________________________________"
    echo "PGUTIL - Programa de Utilidad de Postgres"
    echo "_________________________________________"
    echo "                MENÚ PRINCIPAL           "
    echo "_________________________________________"
    echo "1. Instalar Postgres"
    echo "2. Desinstalar Postgres"
    echo "3. Crear Backup"
    echo "4. Restaurar Backup"
    echo "5. Salir"
    echo -e "\n"
    read -n1 -p "Ingrese una opción [1-5] : " option

    case $option in
        1)
            install_postgreSQL
            ;;
        2)
            uninstall_postgreSQL
            ;;
        3)
            echo -e "\n"
            read -p "Ingrese el nombre de la ruta del directorio para almacenar el backup " name_path_backup
            create_backup $name_path_backup
            ;;
        4)
            echo -e "\n"
            read -p "Ingrese el nombre de la ruta del directorio donde se encuentra el backup " path_backup
            restore_backup $path_backup
            ;;
        5)
            echo -e "Saliendo del programa ... "
            sleep 2
            exit 0
            ;;
        *) 
            echo -e "\nOpcion incorrecta"
            sleep 1
            ;;
    esac
done





