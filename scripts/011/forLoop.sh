#!/bin/bash

arrNumbers=(1 2 3 4 5)

for VAR in ${arrNumbers[*]}
do
	echo $VAR
done

for NAME in "Thom" "Maurick" "Roman" "Aguilar"
do
	echo $NAME
done

echo -e "\nIterar en archivos"

for FILE in * # lo  que hará el asterisco es tener un array de todos los archivos que se encuentren actualmente
							# en el mismo path de donde se encuentra este archivo
do 
	echo "Nombre del archivo : $FILE"
done

echo -e "\nIterar utilizando un comando"

for FILE in $(ls)
do
	echo "Nombre del archivo $FILE"
done

echo -e "\nUtilizando el formato tradicional"

for (( INDEX=1;INDEX < 10;INDEX++  ))
do
	echo "Number $INDEX"
done
