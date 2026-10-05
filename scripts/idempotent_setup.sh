#!/bin/bash

set -e

BASE_DIR="$HOME/bash-linux-automation/output/idempotent-project"

echo "Creating project structure..."

mkdir -p "$BASE_DIR/logs"
mkdir -p "$BASE_DIR/data"
mkdir -p "$BASE_DIR/config"

if [ ! -f "$BASE_DIR/config/settings.conf" ]; then
    echo "Application configuration" > "$BASE_DIR/config/settings.conf"
else
    echo "Configuration file already exists."
fi

if [ ! -f "$BASE_DIR/logs/application.log" ]; then
    touch "$BASE_DIR/logs/application.log"
else
    echo "Log file already exists."
fi

echo "Setup completed successfully."
