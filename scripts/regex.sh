#!/bin/bash

<< COMMENT
	VALIDAR el numero de identificacion que tenga un tamaño de 8 digitos
	País de origen denotado por dos letras en un rango especifico , ejemplo : EC,CO,US
	fecha de nacimiento yyyyMMDD ejemplo 20181222
COMMENT

PATTERN_DNI='^[0-9]{10}$'
PATTERN_COUNTRY='EC|CO|US'
PATTERN_DATE='^(19|20)[0-9]{2}[1-12][1-31]$'
