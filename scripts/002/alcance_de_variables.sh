#!/bin/bash

<<COMMENT
	iremos a buscar donde se encuentran las variables a nivel
	de sistema operativo


	vim /etc/profile  : aquí se configura todas la variables de entorno relaciones al sistema operativo
	
	ahora cuando se necesita tener variables en relacion al usuario
	- lo que hacemos es hacerlo en cada usuario un archivo del programa que se esté utilizando

	Hay que tener en cuenta que existen variables de usuario y variables del sistema operativo
	
	Ingresando como super usuario
	sudo vim /etc/profile
	se creara una variaable de entorno al final
	# variable de entorno a nivel S.O
	COURSE_NAME=Programacion bash
	export COURSE_NAME

COMMENT


# ahora creare varibles a nivel de ususario en este caso es sony (alias tanquesito 7u7)

OPCION=0
NOMBRE=thom

echo "Opcion : $OPCION y nombre : $NOMBRE" 



