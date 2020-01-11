#!/bin/bash

while [[ -n $1  ]];do
	case "$1" in
		-a) echo "-a" ;;
		-b) echo "-b" ;;
		-c) echo "-c" ;;
		 *) echo "nel";; # en el caso que sea diferentes a los demas
	esac
	shift
done
