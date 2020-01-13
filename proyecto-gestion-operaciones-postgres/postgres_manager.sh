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
        return ;
    fi
    echo -e "\n"
    read -s -p "Ingrese la contraseña del sudo : " password_sudo
    read -s -p "Ingrese la contraseña que utilizará en postgres : " password_postgres
    echo -e "\n"
    echo $password_sudo | sudo -S apt update # lo que -S es leer el output de echo y colocarlo como input al sudo --stdin
    echo $password_sudo | sudo -S apt-get -y install postgresql postgresl-contrib # -y:  yes a todas las preguntas
    # cuando ejecutados algun comando con sudo , por defecto el usuario es root y posteriormente nos pide la contraseña
    # pero esto podemos cambiarlo a otro usuario que tambien tenga los mismos privilegios que el superusuario 
    # esto se hace con el -u : sudo -u chavo /comando/de/chavo
    sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$password_postgres}';"
    read -n1 -s -r -p "PRESIONE [ENTER] PARA CONTINUAR ... "
}
