#!/bin/bash

# A script using awk to count occurrences of INFO, WARNING, and ERROR logs.

if [ -z "$1" ]; then
    echo "Usage: ./log_counter.sh <path_to_log_file>"
    echo "Example: ./log_counter.sh ../logs/server.log"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

# Use awk to process the file and count log levels
awk '
/INFO/    { count["INFO"]++ }
/WARNING/ { count["WARNING"]++ }
/ERROR/   { count["ERROR"]++ }
END {
    print "=========================================="
    print "     [ AWK LOG STATISTICS SUMMARY ]       "
    print "=========================================="
    printf "  [+] INFO   : %d\n", count["INFO"]
    printf "  [!] WARNING: %d\n", count["WARNING"]
    printf "  [x] ERROR  : %d\n", count["ERROR"]
    print "=========================================="
}' "$LOG_FILE"
