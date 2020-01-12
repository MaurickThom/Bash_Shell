#!/bin/bash

	
read -s -p "está oculto " clave
echo "$clave"

read -n3 -p " solo tres " tres

echo -e "\n" $tres


if [[ -n $1  ]] ; then
	echo $1
else 
	echo "nel"
fi
