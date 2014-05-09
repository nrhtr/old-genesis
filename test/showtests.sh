#!/bin/sh
tests=$@
for x in $tests
do
    echo Running test "$x"...
    ./runtest.sh $x
    echo
done
