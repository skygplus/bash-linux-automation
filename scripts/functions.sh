#!/bin/bash

# ==========================================
# Bash Functions Demonstration
# ==========================================

show_message() {
    local message="$1"

    echo "MESSAGE: $message"
}

add_numbers() {
    local number1="$1"
    local number2="$2"

    local result=$((number1 + number2))

    echo "Result: $result"
}

check_directory() {
    local directory="$1"

    if [ -d "$directory" ]; then
        echo "Directory exists: $directory"
        return 0
    else
        echo "Directory does not exist: $directory"
        return 1
    fi
}

echo "Testing functions..."

show_message "Bash scripting project"

add_numbers 10 20

check_directory "$HOME"

echo "Function demonstration completed."
