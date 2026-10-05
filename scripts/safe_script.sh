#!/bin/bash

# ==========================================
# Safe Bash Script
# ==========================================

set -e
set -u
set -o pipefail

TEMP_DIR=""

cleanup() {
    echo
    echo "Cleaning up..."

    if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        echo "Temporary directory removed."
    fi

    echo "Cleanup completed."
}

trap cleanup EXIT
trap 'echo "Script interrupted."; exit 1' INT TERM

validate_path() {
    local path="$1"

    if [ -z "$path" ]; then
        echo "ERROR: Path cannot be empty."
        return 1
    fi

    if [ ! -d "$path" ]; then
        echo "ERROR: Directory does not exist: $path"
        return 1
    fi

    echo "Valid directory: $path"
}

echo "======================================"
echo "       SAFE BASH SCRIPT"
echo "======================================"

read -rp "Enter an existing directory: " USER_PATH

validate_path "$USER_PATH"

TEMP_DIR=$(mktemp -d)

echo "Temporary directory created:"
echo "$TEMP_DIR"

echo "Creating temporary file..."

echo "Bash safety test" > "$TEMP_DIR/test.txt"

echo
echo "File created:"
cat "$TEMP_DIR/test.txt"

echo
echo "Script completed successfully."
