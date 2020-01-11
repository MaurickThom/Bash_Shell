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
# nulos por lo que el lenguaje lo coloca en el ultimo + 1 en este caso en la posicion 6 , pero mantiene la referencia
echo "${arrNumbers[8]}"
echo "${arrNumbers[*]}"

# ahora entendiendo lo anterior si nosotros eliminamos el valor en la posicion 8 , mantiene la referencia a la posicion 6
unset arrNumbers[8]  # borrará la posicion 6

echo ${arrNumbers[*]}

arrNumbers[6]=9
unset arrNumbers[8] # no borrara nada

echo ${arrNumbers[*]}
unset arrNumbers[6]

echo ${arrNumbers[*]}

#arreglo de string
arrNames=(Thom, Maurick, Roman, Aguilar)

echo ${arrNames[*]}
echo ${#arrNames[*]}
echo ${arrNames[3]}

# en este punto comienza mi locura

# CAN'T TAKE MY EYES OFF YOU ... 

arrNames[8]=Lucia
echo ${arrNames[*]}
unset arrNames[4] # por mas que la elimine , no podre porque está haciendo referencia a otro espacio de memoria
echo ${arrNames[4]}

arrRanges=({A..Z} {10..20})
echo ${arrRanges[*]}
echo ${#arrRanges[*]}
