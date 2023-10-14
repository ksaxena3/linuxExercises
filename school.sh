#!/bin/bash
cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d, -f7 | {
    sum=0
    count=0
    while IFS= read -r line; do
        sum=$((sum + line))
        count=$((count + 1))
    done

    if [ $count -eq 0 ]; then
        echo "No properties found in MADISON SCHOOLS district."
    else
        average=$((sum / count))
        echo "Average TotalAssessedValue for MADISON SCHOOLS district: $average"
    fi
}
