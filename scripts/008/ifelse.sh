#!/bin/bash

<< COMMENT

cuando en la expresion este estos comando

[[ $edad -ge 65  ]] 

-eq is equal to     						| igual a
-ne is not equal to 						| no es igual a
-gt is greater than 						| mayor a
-ge is greater than or equal to | Mayor o igual a
-lt is less than								| Menor a
-le is less than o equal to 		| Menor o igual a

COMMENT

read -n1 -p "Ingrese cual es su nota (1-9) : " nota
if [[ $nota -eq 7 ]] ; then # (( $nota == 7  ))
	echo -e "\nEl alumno aprobo la materia\n"
else
	echo -e "\nNo aprobo\n"
fi

read -n8 -p "Ingrese el dni : " edad

if (( $edad <= 17 )) ;then
	echo -e "\nLa persona no puede sugradar"
else
	echo -e "\nLa persona puede sufragar"
fi

if [[ $edad -le 18 ]] ;then
	echo "La persona es adolecente"
elif [[ $edad -ge 19 ]] && [[ $edad -le 64  ]] ;then
	echo "La persona es adulta"
else
	echo "adulto mayor"
fi

echo -e "\n"

read -p "Ingrese el pais " pais


if [[ $pais = "EEUU" ]] ;then
 echo "La persona es americana"
elif [ $pais = "Ecuador" ] || [ $pais = "Colombia" ]; then
 echo "La persona es del Sur de América"
else
 echo "Se desconoce la nacionalidad"
fi

echo -e "\n"

read -p "Ingrese el path de algun archivo " pathArchivo

if [[ -d $pathArchivo ]]; then
	echo "El directorio $pathArchivo existe"
else 
	echo "El directorio $pathArchivo no existe"
fi    


