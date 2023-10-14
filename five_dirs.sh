#!/bin/bash

mkdir five

for i in {1..5}; do
    dir="five/dir$i"
    mkdir -p "$dir"
    for j in {1..4}; do
        for k in $(seq $j); do
            echo $j >> "$dir/file$j"
        done
    done
done
