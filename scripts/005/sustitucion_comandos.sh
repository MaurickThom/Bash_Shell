#!/bin/bash

# programa para revisar como ejecutar comandos dentro de un programa y almacenarlos en una variable
# para su posterior utilización

ubicacionActual=`pwd`
infoKernel=$(uname -a) # para sacar toda la informacion a nivel de kernel

echo "La ubicacion actual es $ubicacionActual"
echo "La informacion del kernel es $infoKernel"

<< COMMENT
	OTRAS OPCIONES SIN ALAMACENARLAS EN UNA VARIABLE SON :
	echo "ubicacion actual : `pwd`"
	echo "info kernel : `uname -a`"

COMMENT
