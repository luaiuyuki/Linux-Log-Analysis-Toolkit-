#!/bin/bash

# A script to back up the logs directory using tar compression

# Determine script and project directory paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

LOG_DIR="$PROJECT_ROOT/logs"
BACKUP_FILE="$PROJECT_ROOT/logs_backup.tar.gz"

echo "=========================================="
echo "       [ STARTING LOGS BACKUP ]           "
echo "=========================================="

# Check if logs directory exists
if [ ! -d "$LOG_DIR" ] || [ -z "$(ls -A "$LOG_DIR" 2>/dev/null)" ]; then
    echo "Error: logs directory is empty or does not exist."
    exit 1
fi

echo "Compressing $LOG_DIR into $BACKUP_FILE..."

# Use tar to compress the logs directory
# -c : create a new archive
# -z : compress the archive using gzip
# -f : use archive file
# -C : change to project root directory first, so the archive contains relative paths (logs/ instead of absolute paths)
tar -czf "$BACKUP_FILE" -C "$PROJECT_ROOT" logs

if [ $? -eq 0 ]; then
    echo "Success: Backup created successfully at $BACKUP_FILE"
else
    echo "Error: Failed to create backup."
    exit 1
fi
