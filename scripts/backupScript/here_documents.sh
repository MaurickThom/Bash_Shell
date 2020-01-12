#!/bin/bash

echo "node_modules" >> $1


<< COMMENT
 
 explicacion de lo que pasa en el posterior codigo :

EOM : significa end of message
la sintaxis para esto es
COMANDO <<EOM 
	codigo
	codigo
EOM

lo que pasará es que ejecutara
es un cat de $2 << $1 
no ejecutará nada ya que al concatenar $2 en $1 no da ningun mensaje
pero si quitaramos $1 , el cat seria de $2

COMMENT


cat <<EOM >> $1
$2
EOM

# $2 tiene que ser un archivo que exista
#./here_documents cualquiercosa.txt archivoExiste.txt
