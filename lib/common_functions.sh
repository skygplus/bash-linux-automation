#!/bin/bash

log_info() {
    echo "[INFO] $1"
}

log_warning() {
    echo "[WARNING] $1"
}

log_error() {
    echo "[ERROR] $1"
}

check_command() {
    local command_name="$1"

    if command -v "$command_name" >/dev/null 2>&1; then
        log_info "$command_name is installed."
        return 0
    else
        log_error "$command_name is not installed."
        return 1
    fi
}
