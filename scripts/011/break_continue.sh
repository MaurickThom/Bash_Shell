#!/bin/bash

for file in *
do
	for name in {1..4}
	do
		if [[ $file = "forAnidado.sh" ]] ;then
			echo "forAnidado break"
			break
		elif [[ $file == while* ]] ;then
			echo "algo que contenda while continue"
			continue
		else
			echo "Nombre del archivo 	$file - $name "
		fi
	done
done
