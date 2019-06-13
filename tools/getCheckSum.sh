#!/bin/bash

TEMP_FILE="output.tmp"
STRING="$1"

case `uname` in
  Linux|SunOS|AIX) SHA256=`echo "sha256sum"` ;;
  Darwin) SHA256=`echo "shasum -a 256"` ;;
  *) printf "System not supported\n";exit 1 ;;
esac

sha256_me(){
  printf "$STRING" | xxd -r -p > $TEMP_FILE
  STRING=$($SHA256 $TEMP_FILE | awk '{print $1}')
}

sha256_me
sha256_me

printf "${STRING:0:8}\n"

[ -f $TEMP_FILE ] && rm -f $TEMP_FILE
