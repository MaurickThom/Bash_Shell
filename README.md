# **Programacion Bash Shell Platzi**

> Esta es mi antiguo setup , tenia el error del tmux con zsh
![alt](images/Screenshot&#32;from&#32;2020-01-11&#32;01-59-27.png)

> Ahora ya está arreglado <3
![alt](images/mejorado.png)


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

ystos comandos son colocados en un archivo de texto simple y ejecutados en terminal por el usuario

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

- `rsync` : sincronización remota

```sh
    read -p "Ingresa el host : " host
    read -p "Ingresa el usuario : " usuario

    echo "Lo que hará ahora es comprimir(-z) y los archivos con todo permisos(-a) hacia un acceso remoto, mostrando infomacion adicional del proceso(-v)"
    echo "\$(pwd) como esta dentro de un archivo pwd va entre \$ y () pero si todo el proximo comando va directamente en la terminal se pudede omitir"
    rsync -avz $(pwd) $usuario:host:/Users/thom//Downloads/Backup

```


- [***Ya tengo un repositorio con mi configuracion de vim***](https://github.com/MaurickThom/VIM)
- [**Parametros**](https://likegeeks.com/es/scripting-de-bash-parametros-y-opciones)
- [**[] && [[]]**](https://stackoverflow.com/questions/2188199/how-to-use-double-or-single-brackets-parentheses-curly-braces)
- [**SHELL**](https://blog.desdelinux.net/shell-bash-y-scripts-todo-sobre-shell-scripting/)
- [**Guias de estilo BASH SCRIPT**](https://lignux.com/guia-de-estilos-para-bash-script/)
- [**Carpetas**](https://blog.desdelinux.net/comprobar-si-un-archivo-o-carpeta-existe-o-no-y-mas-con-ciclo-if/)
- [**Here Documents**](https://linuxhint.com/bash-heredoc-tutorial/)
- [**Guia avanzada de bash scripting**](http://tldp.org/LDP/abs/html/)
- [**gzip-1**](https://www.ionos.es/digitalguide/servidores/know-how/que-es-gzip-y-cuales-son-sus-ventajas/)
- [**gzip-2**](https://www.unix.com/shell-programming-and-scripting/212601-changing-file-name-while-compressing.html)
- [**pbzip2**](https://www.muylinux.com/2012/05/31/pbzip2-comprime-y-descomprime-aprovechando-tu-cpu-multi-core/)
- [**rsync_1**](https://www.hostinger.es/tutoriales/rsync-linux/)
- [**rsync_2**](https://www.linuxtotal.com.mx/index.php?cont=rsync-manual-de-uso)
- [**rsync_3**](https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/)
