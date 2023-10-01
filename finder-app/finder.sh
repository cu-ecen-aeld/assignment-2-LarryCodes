#!/bin/sh
# Implementation file for assignment 1


if [ $# -lt 2 ]
then
    echo "Requires 2 arguments, the files directorry and searchstring: Found $#"
    exit 1
fi

filesdir="$1"
searchstr="$2"

if [ ! -d "$filesdir" ]
then
    echo "Argument 1 should be a valid directory: ${filesdir}"
    exit 1
fi

num_files=$(find "$filesdir" -type f | wc -l)
num_matches=$(grep -R "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matches"