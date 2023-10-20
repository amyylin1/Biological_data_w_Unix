#!/bin/bash

# check for at least two arguments on the command line
if [ "$#" -lt 2 ]; then
	echo "Please enter the pathname of your DNA file and the sequence you wish to count."
	exit 1
fi 

seq_file="$1"

# check the first argument is a file name
if [ ! -f "$seq_file" ]; then
	echo "There is no DNA file. Please enter a proper file.  "
	exit 1
fi

# check if the file is a valid dna file 
if grep -Eqvi '^[atcgn]+$' "$seq_file" ; then
	echo 'Please enter a file only contain "atcg" or "ATCG" .'  
	exit 1
fi

# count
for seq_count in "${@:2}"; do

	count=$(grep -o "$seq_count" "$seq_file" | wc -l)
	echo " $seq_count $count"

done
