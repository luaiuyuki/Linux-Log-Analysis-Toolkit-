#!/bin/bash

# Automation script for running log analysis

# Get the directory of this script, then resolve the project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

LOG_DIR="$PROJECT_ROOT/logs"
OUTPUT_DIR="$PROJECT_ROOT/output"
ANALYZER_SCRIPT="$PROJECT_ROOT/analyzer/parser.py"

echo "Starting log analysis..."

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Check if log directory exists and has files
if [ ! -d "$LOG_DIR" ] || [ -z "$(ls -A "$LOG_DIR" 2>/dev/null)" ]; then
   echo "No log files found in $LOG_DIR"
   exit 1
fi

for log_file in "$LOG_DIR"/*; do
    if [ -f "$log_file" ]; then
        # Skip hidden files like .gitkeep
        filename=$(basename -- "$log_file")
        if [[ "$filename" == .* ]]; then
            continue
        fi
        
        echo "Processing $log_file..."
        python "$ANALYZER_SCRIPT" "$log_file" --output "$OUTPUT_DIR/summary.txt"
    fi
done

echo "Analysis complete. Check the $OUTPUT_DIR directory."
