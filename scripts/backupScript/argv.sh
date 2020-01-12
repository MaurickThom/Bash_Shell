#!/bin/bash

echo "\$* $*"
echo "\$@ $@"

# para ver el ultimo valor almacenado 
echo "ultimo valor en los argumentos ${!#}"

TOTAL=1

for VAR in $*;do
	echo "\$* ===> #$TOTAL = $VAR"
	TOTAL=$((TOTAL + 1))
done
echo "Total = $TOTAL"

TOTAL=1

for VALUE in $@;do
	echo "\$@ ==> #$TOTAL = $VALUE"
	TOTAL=$(( TOTAL + 1  ))
done

echo "Total = $TOTAL"

