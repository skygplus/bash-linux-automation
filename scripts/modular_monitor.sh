#!/bin/bash

# ==========================================
# Modular Linux Monitor
# ==========================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../lib/common_functions.sh"

log_info "Starting modular system monitor."

check_command df
check_command free
check_command ps
check_command awk

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

log_info "Current disk usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -lt 80 ]; then
    log_info "Disk usage is within acceptable limits."
else
    log_warning "Disk usage is above the recommended threshold."
fi

log_info "Monitoring completed."
