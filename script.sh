#!/bin/sh
echo "$1"
echo Push metadata to destination org
sfdx force:source:push -f -u "$1"
echo ----------execute-----------
for f in $(cat import-data/order-of-execution-linux.txt)
do
echo "$f"
sfdx force:data:tree:import -u "$1" -p import-data/"$f"
done