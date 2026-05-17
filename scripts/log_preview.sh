#!/bin/bash

# A script to quickly preview the beginning and end of a log file.

if [ -z "$1" ]; then
    echo "Usage: ./log_preview.sh <path_to_log_file>"
    echo "Example: ./log_preview.sh ../logs/server.log"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

echo "=========================================="
echo "      [ PREVIEW: First 5 Lines (HEAD) ]     "
echo "=========================================="
head -n 5 "$LOG_FILE"
echo ""

echo "=========================================="
echo "      [ PREVIEW: Last 5 Lines (TAIL) ]      "
echo "=========================================="
tail -n 5 "$LOG_FILE"
echo ""
echo "Preview completed for: $LOG_FILE"
