#!/bin/bash

numA=10
numB=4

echo "Números A=$numA y B=$numB"
echo "Sumar A+B = " $((numA + numB))
echo "Restar A-B = " $((numA - numB))
# se hace la misma forma para el producto, la division y el residuo

echo -e  "\nOperadores ralacionales" # ese -e es para que entienda el \n
echo "A>B =" $((numA > numB)) # retorna 1 si es true y 0 para false
echo "A==B =  " $((numA == numB))
# igual < , <= , >= , == , !=

echo -e "\nOperadores de asignación"
echo "Sumar A+=B" $((numA += numB))
#  es igual para  -= , *=, /= , %=
