#!/bin/bash

ruta=$1

if [[ !( -d $ruta ) ]] ;then
    echo "no existe la ruta $1"
else
    echo "si existe la ruta $1"
fi
