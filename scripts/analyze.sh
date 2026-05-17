#!/bin/bash

# A comprehensive analysis script combining Python parsing and Linux command-line tools.

if [ -z "$1" ]; then
    echo "Usage: ./analyze.sh <path_to_log_file>"
    echo "Example: ./analyze.sh ../logs/server.log"
    exit 1
fi

LOG_FILE="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
REPORT_FILE="$PROJECT_ROOT/output/report.txt"
ANALYZER_SCRIPT="$PROJECT_ROOT/analyzer/parser.py"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

# Ensure output directory exists
mkdir -p "$PROJECT_ROOT/output"

echo "Generating comprehensive report to $REPORT_FILE..."

# Initialize the report file
echo "==========================================" > "$REPORT_FILE"
echo "        COMPREHENSIVE LOG REPORT          " >> "$REPORT_FILE"
echo "==========================================" >> "$REPORT_FILE"
echo "File analyzed: $LOG_FILE" >> "$REPORT_FILE"
echo "Generated at : $(date)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 1. Run Python Analyzer
echo "--- 1. Python Analyzer Results ---" >> "$REPORT_FILE"
python "$ANALYZER_SCRIPT" "$LOG_FILE" >> "$REPORT_FILE" 2>&1
echo "" >> "$REPORT_FILE"

# 2. Run grep ERROR
echo "--- 2. Raw ERROR Logs (via grep) ---" >> "$REPORT_FILE"
grep "ERROR" "$LOG_FILE" >> "$REPORT_FILE" 2>&1 || echo "No ERRORs found by grep." >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 3. Run tail 10 lines
echo "--- 3. Last 10 Lines of Log (via tail) ---" >> "$REPORT_FILE"
tail -n 10 "$LOG_FILE" >> "$REPORT_FILE" 2>&1
echo "" >> "$REPORT_FILE"

echo "Report generation completed successfully!"
