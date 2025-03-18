#!/bin/bash
set -e

FILE="/tmp/temp.mips"

if [ $# -ne 1 ]; then
    echo "Incorrect usage: <Mips File>" && exit 1
fi

# Copy file to cse
scp $1 cse:~/.temp.mips

# Run file on cse
ssh cse "1521 mipsy ~/.temp.mips"
