#!/bin/bash

argv_1=$1
argv_2=$2


if [ -z "$argv_1" ] ; then # esto devolverá true si la variable esta vacia
	echo "La variable argv_1 está vacia"
fi

if [ -z "$argv_2" ]; then
	echo -e "\nLa variable argv_2 está vacia"
fi

if [[ !(-z "$argv_1" || -z "$argv_2") ]]; then
	if [[ $argv_1  ]];then
		echo "El valor de la variable argv_1 es $argv_1"
	fi
	if [[ $argv_2 ]]; then
		echo "El valor de la variable argv_2 es $argv_2"
	fi
	echo "Los parametros fueron $*"
fi
echo "El numero de parametros enviados son $#"
