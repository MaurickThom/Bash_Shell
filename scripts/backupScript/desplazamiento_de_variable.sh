#!/bin/bash

# El comando shift mueve ada parametro de variable a la izquierda

<<COMMENT
	OJO el $0 SIEMPRE SERÁ EL NOMBRE DEL SCRIPT

	LUEGO COMIENZA LOS CAMBIOS 
	$1 eliminado
	$2 $1
	$3 $2
	...

	otra forma de iterar los parametros

COMMENT

TOTAL=1

while [[ -n $1  ]];do
	echo "#$TOTAL = $1"
	TOTAL=$(( TOTAL + 1  ))
	shift
done




