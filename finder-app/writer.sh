#!/bin/sh
# Implementation of assignment 1 writer

if [ $# -lt 2 ]
then
    echo "Requires 2 arguments, the file path and writestring: Found $#"
    echo "Usage: $0 <filepath> <writestring>"
    exit 1
fi

writefile="$1"
writestr="$2"

# First check if directory exists
file_path=$(dirname "$writefile")
if [ ! -d "$file_path" ]
then
    mkdir -p "$file_path"
    # Exit if making directory is not successful
    if [ $? -ne 0 ]
    then
        echo "Failed creating directory structure!"
        exit 1
    fi
fi

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]
then
    echo "Failed to create and write file."
    exit 1
fi

echo "File successfully created."