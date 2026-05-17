#!/bin/bash

# A script to find all .log files in the project directory using the 'find' command.

# Determine the project root relative to where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "=========================================="
echo "      [ SEARCHING FOR .LOG FILES ]        "
echo "=========================================="
echo "Searching in directory: $PROJECT_ROOT"
echo ""

# Execute the find command to search for all files ending in .log
# -type f : look for files only (not directories)
# -name   : match the pattern "*.log"
find "$PROJECT_ROOT" -type f -name "*.log"

echo ""
echo "Search completed."
