#!/bin/bash

# ==========================================
# Directory Automation Script
# ==========================================

BASE_DIR="$HOME/bash-linux-automation/output"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

PROJECT_DIR="$BASE_DIR/project_$TIMESTAMP"

echo "Starting directory setup..."
echo "Creating: $PROJECT_DIR"

# Create nested directories
mkdir -p "$PROJECT_DIR/logs"
mkdir -p "$PROJECT_DIR/data"
mkdir -p "$PROJECT_DIR/config"

# Create files
touch "$PROJECT_DIR/logs/application.log"
touch "$PROJECT_DIR/data/users.txt"
touch "$PROJECT_DIR/config/settings.conf"

# Add content
echo "Bash Automation Project" > "$PROJECT_DIR/config/settings.conf"
echo "Created: $TIMESTAMP" >> "$PROJECT_DIR/config/settings.conf"

echo "User1" > "$PROJECT_DIR/data/users.txt"
echo "User2" >> "$PROJECT_DIR/data/users.txt"

echo "Application started" > "$PROJECT_DIR/logs/application.log"

echo
echo "Directory structure created successfully."
echo "Location: $PROJECT_DIR"

# Display results
find "$PROJECT_DIR" -type f -print
