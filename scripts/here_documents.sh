#!/bin/bash

echo "node_modules" >> $1

cat <<EOM >>$1
$2
EOM

