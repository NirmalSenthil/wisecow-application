#!/bin/bash

# Path to the log file
LOG_FILE="/var/log/nginx/access.log"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found!"
    exit 1
fi

# Number of 404 errors
NUM_404_ERRORS=$(grep " 404 " "$LOG_FILE" | wc -l)
echo "Number of 404 errors: $NUM_404_ERRORS"

# Top 5 most requested pages
echo "Top 5 most requested pages:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5

# Top 5 IP addresses with the most requests
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5

