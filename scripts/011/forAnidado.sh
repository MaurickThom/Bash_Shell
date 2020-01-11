#!/bin/bash

for file in $(ls)
do
	for name in {1..4}
	do
		echo "Nombre del archivo : $file - $name"
	done
done
