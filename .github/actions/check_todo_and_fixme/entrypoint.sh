#!/bin/sh
passed=1

# TODO!またはFIXME!コメントがあるかをチェックする
check=$(egrep -rn "TODO\!|FIXME\!" *)

case $? in
  0 ) echo $check && passed=0;;
  * ) echo "No TODO!'s found";;
esac

case $passed in
  0 ) exit 1;;
  1 ) exit 0;;
esac
