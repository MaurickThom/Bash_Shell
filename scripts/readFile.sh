#!/bin/bash

count=1

file=$1

cat $file | while read line;do
	echo "#$count : $line"
	count=$((count + 1))
done

echo -e "\n"

count=1
while read line;do
	echo "#$count : $line"
	count=$((count + 1))
done <$file
