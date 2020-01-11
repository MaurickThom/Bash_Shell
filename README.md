# **Programacion Bash Shell Platzi**

## **Linux :**

Linux consta de algunas partes principales

- KERNEL : nucleo del sistema operativo , el cual se gestiona todos los recursos del hardware
  como con la memoria , el procesamiento y todos los dispositivos perifericos conectados en el computador
- SHELL : interprete de un programa que tiene una interfaz de usuario(terminal) que permite ejecutar las aplicaciones
- Aplicaciones : aplicaciones comunes

## **Tipos de Shell en linux**

- sh
- ksh
- csh
- bash

`man comando`<br>
`info comando` este muestra mas completo

## **¿Qué es el bash scripting?**

La idea básica de bash scripting o programación en shell es poder
***ejecutar múltiples comandos de forma secuencial para automatizar una tarea en especifico***

Estos comandos son colocados en un archivo de texto simple y ejecutados en terminal por el usuario

- El comando `type comando` o `type -a comando` o `type -t comando`  nos verifica el nombre y
	donde se encuentra, es una buena practica usar estos comandos antes de nombrarlo para poder
	evitar los nombres repetidos de archivos

## **¿Cómo realizar la sustitución de comandos en variables?**

La idea de la sustitución de comandos en variables es almacenas las salidas de una ejecución de un comando
en una variable

- Usando el backtick
- Usando el signo dolar con el formato $(comando)

## **¿Cómo realizar el debug de un script**

Hay dos opciones para realizar el debug utilizando el comando bash

- `-v` Utilizado para ver el resultado detallado de nuestro script, evaluado linea por linea
- `-x` Utilizado para desplegar la información de los comandos que son utilizados, capturando
	el comando salida

	- `bash -v ./script.sh` Esto me mostrara todo es como un cat + ./script.sh
	- `bash -x ./script.sh` aquí solo me mostra el comando en un `+` al comienzo
		y posteriormente el output del comando

- `read -s` : Oculta la información entrante por el propio usuario
- `read -n#numero ` : `read -n3` eso significa que validara el tamaño solo tomará los 3 primeos
- `read -p` indica que hay que dejar la información ingresada en la variable siguiente

```sh
	# ojo el -p va siempre al final
	read -s -p "Clave " clave
	echo $clave

	read -n8 -p "DNI" dni
	echo $dni
```

## **Comando `source`**

Cuando se ejecuta desde shell un comando o un script, se crea un subproceso(procesos hijo) de la shell que ejecuta
el comando o el script (proceso padre). Si el script que ejecuta el proceso hijo crea o modifica alguna variable 
de entorno, esos cambios o variables desaparecen cuando finaliza el comando o script.

El comando source ayudará a persistir estos cambios `source script.sh` o `source comando`

- [***Ya tengo un repositorio con mi configuracion de vim***](https://github.com/MaurickThom/VIM)
- [**Parametros**](https://likegeeks.com/es/scripting-de-bash-parametros-y-opciones)
- [**[] && [[]]**](https://stackoverflow.com/questions/2188199/how-to-use-double-or-single-brackets-parentheses-curly-braces)
- [**SHELL**](https://blog.desdelinux.net/shell-bash-y-scripts-todo-sobre-shell-scripting/)

