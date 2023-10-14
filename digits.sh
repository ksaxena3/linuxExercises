#!/bin/bash
for number in {1000..2000}; do
    if [[ $number =~ ^[01]+$ ]]; then
        sum=$((sum + number))
    fi
done

echo "Sum of numbers with only 0s and 1s between 1000 and 2000: $sum"
