#!/bin/bash

OPTION=0
BACKUP_NAME=""

echo -n "Ingrese una opción : "
read
OPTION=$REPLY
echo -en "\nIngresa el nombre del archivo del backup : "
read
BACKUP_NAME=$REPLY
echo -e "\nOpción : $OPTION , Backup name : $BACKUP_NAME"

