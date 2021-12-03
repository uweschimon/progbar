#!/bin/sh
# uwe.schimon@mailpost.de 20211202 03

ST=/etc/
MAX=`find "$ST" -type f | wc -l | awk '{print $1}'`

mkdir -p cufile; rm cufile/*

ds=`date +%s`
. ./progbar.sh

find "$ST" -type f | while read f
do
 echo "$f" >> "cufile/"`md5sum "$f" | awk '{print $1}'`
 r=$((r+1))
 progbar $r $MAX $ds `date +%s`
done

echo
u=`ls -l cufile | wc -l`
if [ $u -lt $MAX ]
then
 echo "$u unique in $MAX files found."
 wc -l cufile/* | grep -v " 1 " | grep cufile | sort -n > notunique.txt
 echo "to analyse use notunique.txt"
else
 echo "All files are unique in '$ST'"
fi
