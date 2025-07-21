#!/bin/bash
start_date="2025-07-22"
end_date="2026-07-22"
current="$start_date"

while [ "$current" != "$(date -I -d "$end_date + 1 day")" ]; do
    echo "Processing $current..."
    commit_count=$((RANDOM % 4 + 5))
    for ((i=1; i<=commit_count; i++)); do
        echo "Update on $current - $i" >> activity.log
        git add .
        git commit -m "update: $current [$i]" --date="$current 0$i:00:00"
    done
    current=$(date -I -d "$current + 1 day")
done

git push origin main
