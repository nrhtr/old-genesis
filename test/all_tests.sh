#!/bin/sh
for x in ./tests/*.cdc
do
    echo Running test "$x"...
    ./runtest.sh $x
    echo
done
