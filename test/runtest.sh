#!/bin/sh
testdb=$1
trap "rm -rf binary" 0 1 2
tmp=`mktemp`
cat lib.cdc $testdb driver.cdc > $tmp
./coldcc -f -o -W -t $tmp 2>/dev/null
rm $tmp
