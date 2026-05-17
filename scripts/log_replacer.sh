#!/bin/bash

# A script using sed to replace 'ERROR' with 'FAIL' in a log file and save to a new file.

if [ -z "$1" ]; then
    echo "Usage: ./log_replacer.sh <path_to_log_file> [output_file]"
    echo "Example: ./log_replacer.sh ../logs/server.log"
    exit 1
fi

INPUT_FILE="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Default output file path if not provided
if [ -z "$2" ]; then
    FILENAME=$(basename -- "$INPUT_FILE")
    FILENAME_NO_EXT="${FILENAME%.*}"
    OUTPUT_FILE="$PROJECT_ROOT/output/${FILENAME_NO_EXT}_replaced.log"
else
    OUTPUT_FILE="$2"
fi

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' does not exist."
    exit 1
fi

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT_FILE")"

echo "=========================================="
echo "       [ STARTING TEXT REPLACEMENT ]      "
echo "=========================================="
echo "Replacing 'ERROR' with 'FAIL'..."
echo "Input : $INPUT_FILE"
echo "Output: $OUTPUT_FILE"
echo ""

# Use sed to replace ERROR with FAIL globally
sed 's/ERROR/FAIL/g' "$INPUT_FILE" > "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Success: Replacement completed successfully!"
    echo "New file created at: $OUTPUT_FILE"
else
    echo "Error: Replacement failed."
    exit 1
fi
