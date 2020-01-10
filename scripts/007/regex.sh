#!/bin/bash

<< COMMENT
	VALIDAR el numero de identificacion que tenga un tamaño de 8 digitos
	País de origen denotado por dos letras en un rango especifico , ejemplo : EC,CO,US
	fecha de nacimiento yyyyMMDD ejemplo 20181222
COMMENT

PATTERN_DNI='^[0-9]{8}$'
PATTERN_COUNTRY='EC|CO|US'
PATTERN_DATE='^(19|20)[0-9]{2}[1-12][1-31]$'

echo "REGEX"

#read -p "DNI : " DNI

while :
do
	read -p "DNI " DNI
	if [[ $DNI =~ $PATTERN_DNI  ]]; then
		echo "El dni $DNI es valido"
		break
	else
		echo "El dni $DNI es invalido"
	fi
done
# hacer lo mismo para estos

read -p "País : " COUNTRY
read -p "Fecha de nacimiento : " DATE


