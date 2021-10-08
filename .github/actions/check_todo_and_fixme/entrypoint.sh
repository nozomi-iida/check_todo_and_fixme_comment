#!/bin/sh

# default passed is true, if fails checks then passed is false
passed=1
# git diffでbase branchとhead branchを比較すると指定する必要がある

todo=$(git diff --diff-filter=A | grep 'TODO!')
# ↑これで何も取得できなければ1が，一つでも取得できれば0が返ってくる
case $? in
  0 ) echo $todo && passed=0;;
  * ) echo "No TODO!'s found";;
esac

fixme=$(git diff --diff-filter=A | grep 'FIXME!')
case $? in
  0 ) echo $todo && passed=0;;
  * ) echo "No FIXME!'s found";;
esac

case $passed in
  0 ) exit 1;;
  1 ) exit 0;;
esac
