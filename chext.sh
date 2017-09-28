#!/bin/bash

DIR="./files"
EXT="txt"
CHEXT="mp4"

cd "./$DIR"

for i in * ; do
    EXTLEN=$(echo "$EXT" | awk '{ print length($0); }')
    echo "EXTLEN $EXTLEN"

    EXTENSION=$(echo "$i" | rev | cut -c 1-"$EXTLEN" | rev)
    echo "EXTENSION $EXTENSION"

    BASENAME=$(echo "$i" | rev | cut -c 4- | rev)
    echo "BASENAME $BASENAME"

    if [ "$EXTENSION" == "$EXT" ]; then
        mv "$i" "$BASENAME$CHEXT"
        echo "Renamed $i to $BASENAME$CHEXT"
    else
        echo "Extension does not match; skipping this file"
    fi
    
    unset EXTLEN
    unset EXTENSION
    unset BASENAME
done

cd ..
