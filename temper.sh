#!/bin/sh
# to do: add arguments and errors
# usage: cat temperaments.txt | sh temper.sh > newtemperaments.txt
while read line
    do
    set -- $line
    addnumba=$1
#   echo "$addnumba"
    while [ $# -gt 0 ]
    do
        current=$(echo $1)
        echo $current | egrep -q '^[-]?[0-9]+\.?[0-9]*$'
        if [ $? == 0 ]
            then
            current=$(echo "$current - $addnumba" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
        fi
        if [ $# == 1 ]
            then
            echo "$current"
            else
            echo "$current \c"
        fi
        shift 1
    done
done