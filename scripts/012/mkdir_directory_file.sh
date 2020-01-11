#!/bin/bash

echo -e "script de creacion de archivos o directorios\n"

tipo=$1
name=$2

if [[ -z $name ]] ;then
	name="nothing"
fi

if [[ $tipo = "d" ]] ;then
	if [[ -d $name  ]] ;then
		echo "El direcorio ya existe :("
		return;
	fi
	mkdir -m 755 $name # ese -m es un argumento que existe en mdkir que le dice el modo (chmod permisos)
	echo "Direcorio $name/ creado exitosamente"
	ls -alh $name
elif [[ $tipo = "f" ]] ;then
	if [[ -f $name ]] ;then
		echo "El archivo ya existe"
		return;
	fi
	touch $name && chmod u+x $name
	ls -lah $name
else
	echo "argumentos no validos"
fi

