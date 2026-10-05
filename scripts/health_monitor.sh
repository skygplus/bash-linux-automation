#!/bin/bash

# ==========================================
# Linux System Health Monitor
# ==========================================

echo "======================================"
echo "       LINUX SYSTEM HEALTH MONITOR"
echo "======================================"

# Disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

# Memory usage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

# CPU load
CPU_LOAD=$(uptime | awk -F'load average:' '{print $2}')

# Number of running processes
PROCESS_COUNT=$(ps aux --no-heading | wc -l)

echo
echo "Disk Usage:      ${DISK_USAGE}%"
echo "Memory Usage:    ${MEMORY_USAGE}%"
echo "CPU Load:        ${CPU_LOAD}"
echo "Processes:       ${PROCESS_COUNT}"

echo
echo "--------------------------------------"
echo "Health Checks"
echo "--------------------------------------"

# Disk threshold
if [ "$DISK_USAGE" -lt 80 ]; then
    echo "PASS: Disk usage is below 80%."
else
    echo "WARNING: Disk usage is above 80%."
fi

# Memory threshold
if [ "$MEMORY_USAGE" -lt 80 ]; then
    echo "PASS: Memory usage is below 80%."
else
    echo "WARNING: Memory usage is above 80%."
fi

# Process check
if [ "$PROCESS_COUNT" -gt 0 ]; then
    echo "PASS: Running processes detected."
else
    echo "FAIL: No running processes detected."
fi

echo
echo "Health monitoring completed."

exit 0
