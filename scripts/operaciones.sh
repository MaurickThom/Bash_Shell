#/bin/bash

mkdir -m 755 backupScript

echo "Copiando todos los archivos que contengan . "
cp *.* backupScript/
ls -la backupScript/


echo "Es hora de empaquetar y mostrar lo que hemos empaquetado -cvf"
tar -cvf empaque.tar backupScript/
tar -cvf shellCourse.tar *.sh

# Cuando se comprime gzip el anterior se elimina
# pero lo impedimos en -k
gzip -k -cvf shellCourse.tar > shellCourse_c.tar.gz # por defecto el ratio es de 5
# para descomprir usamos -d y se elimina el comprimido pero lo impedimos con -k
gzip -d -k shellCourse_c.tar.gz

# comprimir con controaseña
zip -e nombre_del_archivo_comprimido.zip *.sh
# para descomprimir
unzip nombre_del_archivo_comprimido.zip

