#!/bin/bash

arrNumbers=(1 2 3 4 5 6)
echo "Valores del array \$arrNumbers : " ${arrNumbers[*]}
echo "Longitud del array \$arrNumbers : " ${#arrNumbers[*]}

#posicion

echo "Posicion 2 " ${arrNumbers[3]}
echo "Posicion 0 " ${arrNumbers[0]}

echo -e "\nAñadiendo elementos a \$arrNumbers "
echo "Añadiendo el numero 2 "
arrNumbers[8]=9 # como se pude ver agrefa un valor en la posicon 8 pero como el ultimo es 5 , el 6 y 7 serian 
# nulos por lo que el lenguaje lo coloca en el ultimo + 1 en este caso en la posicion 6
echo "${arrNumbers[8]}"
echo "${arrNumbers[*]}"

# ahora entendiendo lo anterior si nosotros eliminamos el valor en la posicion 8 , al final no borrará nada
unset ${arrNumbers[8]}

echo ${arrNumbers[*]}
