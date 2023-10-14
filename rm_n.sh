#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "usage: $0 <dir> <n>" 1>&2
    exit 1
fi

dir="$1"
size="$2"

if [ ! -d "$dir" ]; then
    echo "Error: Directory '$dir' not found." 1>&2
    exit 1
fi

find "$dir" -type f -size +${size}c -exec rm {} \;

echo "Files larger than ${size} bytes removed successfully from '$dir'."
