#!/bin/bash

if [ $# -eq 0 ];
then
echo "usage $0 <file>"
exit 1
fi

file=$1

if [ ! -f $file ];
then
echo "file not found"
exit 1
fi

cat $file
| tr -cs '[:alnum:]' '[\n*]' \
| tr '[:upper:]' '[:lower:]' \
| sort \
| uniq -c \
| sort -nr \
| head -n5