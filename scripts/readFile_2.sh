#!/bin/bash

echo "Segunda forma de leer un archivo almacenandolo en una variable"

#cat $1


valorCat=`cat $1`

#echo "$valorCat"

# La variable IFS(Internal Field Separator) es una variable global
# nos ayudara para evitar los espacion es blanco al inicio
# y final es como un split
<< COMMENT
 POR DEFECTO IFS ES ESPACIO VACIO POR LO POR CADA ESPACIO VACIO
 LO INTERPRETRÁ COMO UNA LINEA
 ESTO SE PUEDE CONFIGURAR 
 IFS=.
 IFS=,

 ip = 1.2.3.4
 EJEMPLO PODER DIVIDIR LA IP EN 4 VARIABLES
 IFS=. read ip1 ip2 ip3 ip4 <<< "$ip"
 echo $ip1 $ip2 ...


COMMENT

echo $IFS # ESTO DEVOLVERÁ UN ESPACIO VACIO
while IFS= read linea 
do
 echo $linea
done <$1
