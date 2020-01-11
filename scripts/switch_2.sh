#!/bin/bash

read -n1 -p "Escribe una opcion del  A-Z : " letter

echo -e "\n"

case ${letter^^} in
	"A") echo "Operación eliminar";;
	"B") echo "Operación guardar";;
	[C-Z]) echo "sin permisos";;
	*) echo "operacion invalida";;
esac
