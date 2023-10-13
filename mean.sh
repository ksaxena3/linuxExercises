#!/bin/bash

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <column> [file.csv]" >&2
    exit 1
fi

# Get column number
column="$1"

# Determine the input source (file or stdin)
if [ "$#" -eq 2 ]; then
    file="$2"
else
    file="/dev/stdin"
fi

# Check if the file exists (except for /dev/stdin)
if [ "$file" != "/dev/stdin" ] && [ ! -f "$file" ]; then
    echo "Error: File '$file' not found." >&2
    exit 1
fi

# Calculate mean
mean=$(cut -d ',' -f "$column" "$file" | tail -n +2 | { sum=0; count=0; while read -r value; do sum=$((sum + value)); count=$((count + 1)); done; echo "scale=2; $sum / $count" | bc; })

# Print mean
if [ "$file" != "/dev/stdin" ]; then
    echo "Mean of column $column in '$file': $mean"
else
    echo "Mean of column $column from stdin: $mean"
fi

