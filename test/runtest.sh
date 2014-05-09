#!/bin/sh
testdb=$1
trap "rm -rf binary" 0 1 2
cat .lib.cdc $testdb .driver.cdc > tmp_test.cdc
./coldcc -f -o -W -t tmp_test.cdc 2>/dev/null
