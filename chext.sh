#!/bin/bash

DIR="files"
EXT="m4v"
CHEXT="mp4"

cd "./$DIR"

for i in * ; do
	
	for j in $(echo $i | tr "." "\n"); do
    	if [ -z "$BASENAME" ]; then
    		BASENAME="$PREV"
    	else
    		BASENAME="$BASENAME.$PREV"
    	fi 
    	PREV="$j"
    done

    if [ "$PREV" == "$EXT" ]; then
    	mv "$i" "$BASENAME.$CHEXT"
    	echo "Renamed $i to $BASENAME.$CHEXT"
    fi
    
    unset BASENAME
    unset PREV
done

cd ..
