# Bash Linux Automation

## Overview

This project provides a practical introduction to Bash scripting and Linux automation for DevOps environments.

The objective is to move from manually executing Linux commands to developing reusable, reliable and safer Bash automation scripts.

The project covers filesystem automation, Linux system monitoring, functions, modular scripting, input validation, error handling, signal trapping, cleanup and Git-based version control.

The completed project demonstrates how Bash can be used to automate common Linux administration tasks and provides a foundation for more advanced DevOps automation, CI/CD pipelines and infrastructure management.

---

## Project Objectives

The project was designed around five key objectives:

1. **Automate File Systems**

   * Create directories and files automatically.
   * Use variables and timestamps.
   * Use `mkdir -p`, `touch` and `echo`.
   * Demonstrate idempotent execution.

2. **Implement System Monitoring**

   * Monitor disk usage.
   * Monitor memory usage.
   * Count running processes.
   * Capture CPU load.
   * Apply threshold-based health checks.

3. **Develop Modular Bash Code**

   * Create reusable functions.
   * Pass arguments using `$1` and `$2`.
   * Use local variables.
   * Create and source an external function library.

4. **Implement Script Safety**

   * Use `set -e`.
   * Use `set -u`.
   * Use `set -o pipefail`.
   * Validate user input.
   * Handle interruptions using `trap`.
   * Clean up temporary files.

5. **Follow Professional DevOps Practices**

   * Use a structured repository.
   * Document scripts and design decisions.
   * Validate Bash syntax.
   * Track the project using Git.
   * Publish the project to GitHub.

---

## Technology Stack

| Technology   | Purpose                       |
| ------------ | ----------------------------- |
| Ubuntu Linux | Linux development environment |
| Bash         | Automation and scripting      |
| WSL2         | Windows Linux environment     |
| Git          | Source control                |
| GitHub       | Repository hosting            |
| VS Code      | Code editing                  |
| `mkdir`      | Directory creation            |
| `touch`      | File creation                 |
| `df`         | Disk monitoring               |
| `free`       | Memory monitoring             |
| `ps`         | Process monitoring            |
| `uptime`     | CPU/load information          |
| `awk`        | Text and data processing      |
| `trap`       | Signal handling and cleanup   |

---

## Project Structure

```text
bash-linux-automation/
│
├── README.md
├── CHECKLIST.md
├── .gitignore
│
├── scripts/
│   ├── directory_setup.sh
│   ├── idempotent_setup.sh
│   ├── health_monitor.sh
│   ├── functions.sh
│   ├── modular_monitor.sh
│   └── safe_script.sh
│
├── lib/
│   └── common_functions.sh
│
├── output/
│   └── .gitkeep
│
├── docs/
│   └── project-notes.md
│
└── screenshots/
    ├── 01-environment.png
    ├── 02-project-structure.png
    ├── 03-directory-automation.png
    ├── 04-idempotent-script.png
    ├── 05-health-monitor.png
    ├── 06-exit-code.png
    ├── 07-functions-library.png
    ├── 08-input-validation.png
    ├── 09-trap-cleanup.png
    ├── 10-syntax-testing.png
    ├── 11-git-status.png
    └── 12-github-repository.png
```

---

# Scripts

## 1. `directory_setup.sh`

This script automates the creation of a nested project directory structure.

It demonstrates:

* Variables
* Command substitution
* Timestamps
* `mkdir -p`
* `touch`
* `echo`
* Dynamic file generation

The script creates directories for:

```text
logs/
data/
config/
```

It also creates configuration, user and application log files.

Example:

```bash
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
```

The timestamp is used to generate a unique project directory.

---

## 2. `idempotent_setup.sh`

This script demonstrates idempotent automation.

An idempotent script can be executed multiple times without producing unwanted errors or repeatedly damaging existing resources.

The script uses:

```bash
mkdir -p
```

and conditional checks such as:

```bash
if [ ! -f "$BASE_DIR/config/settings.conf" ]; then
```

When the script is executed again, it detects existing files rather than unnecessarily recreating them.

---

## 3. `health_monitor.sh`

The system health monitoring script collects basic Linux system information.

It checks:

* Disk usage
* Memory usage
* CPU load
* Running processes

Commands used include:

```bash
df
free
ps
uptime
awk
```

The script compares system usage against predefined thresholds.

For example:

```bash
if [ "$DISK_USAGE" -lt 80 ]; then
    echo "PASS: Disk usage is below 80%."
else
    echo "WARNING: Disk usage is above 80%."
fi
```

This demonstrates how Bash can be used for basic monitoring and automated health checks.

---

## 4. `functions.sh`

This script demonstrates modular programming using Bash functions.

Functions are used for:

* Displaying messages
* Performing calculations
* Checking whether directories exist

Arguments are passed using:

```bash
$1
$2
```

Local variables are created using:

```bash
local
```

Example:

```bash
add_numbers() {
    local number1="$1"
    local number2="$2"

    local result=$((number1 + number2))

    echo "Result: $result"
}
```

Using functions makes scripts easier to maintain and reuse.

---

## 5. `modular_monitor.sh`

This script demonstrates how Bash can use an external function library.

The library is located at:

```text
lib/common_functions.sh
```

The script loads the library using:

```bash
source "$SCRIPT_DIR/../lib/common_functions.sh"
```

The external library contains reusable functions such as:

```bash
log_info
log_warning
log_error
check_command
```

This approach separates reusable functionality from the main application logic.

---

## 6. `safe_script.sh`

This script demonstrates defensive Bash programming.

The script uses:

```bash
set -e
set -u
set -o pipefail
```

### `set -e`

Stops the script when a command fails.

### `set -u`

Treats the use of unset variables as an error.

### `set -o pipefail`

Ensures that a pipeline fails if an earlier command fails.

The script also validates user-provided directories before continuing.

Temporary resources are created using:

```bash
mktemp -d
```

and removed automatically during cleanup.

---

# Error Handling and Cleanup

The project uses `trap` to handle script termination and cleanup.

Example:

```bash
trap cleanup EXIT
trap 'echo "Script interrupted."; exit 1' INT TERM
```

This allows the script to respond to:

* Normal script termination
* `CTRL+C`
* Termination signals

Temporary files and directories can therefore be cleaned up rather than being left behind.

---

# Idempotency

Idempotency is an important concept in DevOps automation.

An idempotent operation can be performed repeatedly while maintaining the desired final state.

For example:

```bash
mkdir -p "$BASE_DIR/logs"
```

does not fail if the directory already exists.

The project demonstrates idempotency through conditional file creation and the use of `mkdir -p`.

This approach is useful in:

* Configuration management
* Deployment automation
* Infrastructure automation
* CI/CD pipelines
* Server provisioning

---

# System Monitoring

The health monitor uses standard Linux utilities.

### Disk

```bash
df /
```

Used to determine filesystem usage.

### Memory

```bash
free
```

Used to obtain memory statistics.

### Processes

```bash
ps aux
```

Used to inspect running processes.

### CPU/load

```bash
uptime
```

Used to obtain system load information.

The results are stored in Bash variables and evaluated using conditional statements.

---

# Exit Codes

Bash commands return exit codes.

A successful command normally returns:

```text
0
```

The previous command's exit code can be displayed using:

```bash
echo $?
```

A non-zero exit code normally indicates a failure or error condition.

Exit codes are important in DevOps because CI/CD systems can use them to determine whether a stage or command succeeded.

---

# Testing

All Bash scripts were checked using Bash's syntax validation mode.

The following command was used:

```bash
bash -n script.sh
```

Multiple scripts can also be tested with:

```bash
for script in scripts/*.sh
do
    echo "Checking $script"
    bash -n "$script"
done
```

Successful syntax validation produces no Bash syntax error messages.

The scripts were also executed manually to validate their expected behaviour.

---

# Evidence and Screenshots

The project includes screenshots demonstrating the implementation and testing process.

| Screenshot                    | Evidence                              |
| ----------------------------- | ------------------------------------- |
| `01-environment.png`          | Linux, Bash and Git environment       |
| `02-project-structure.png`    | Repository structure                  |
| `03-directory-automation.png` | Automated directory and file creation |
| `04-idempotent-script.png`    | Repeated script execution             |
| `05-health-monitor.png`       | Linux system health monitoring        |
| `06-exit-code.png`            | Bash exit code validation             |
| `07-functions-library.png`    | Functions and external library        |
| `08-input-validation.png`     | Input validation                      |
| `09-trap-cleanup.png`         | Signal handling and cleanup           |
| `10-syntax-testing.png`       | Bash syntax validation                |
| `11-git-status.png`           | Git repository and commits            |
| `12-github-repository.png`    | Published GitHub repository           |

---

# Git Workflow

Git was used to track the project.

The repository was initialised using:

```bash
git init
```

Files were staged using:

```bash
git add .
```

A commit was created using:

```bash
git commit -m "Add Bash Linux automation project"
```

The main branch was configured using:

```bash
git branch -M main
```

The repository was then pushed to GitHub.

---

# How to Run the Project

Clone the repository:

```bash
git clone https://github.com/YOUR-USERNAME/bash-linux-automation.git
```

Change into the project directory:

```bash
cd bash-linux-automation
```

Make the scripts executable:

```bash
chmod +x scripts/*.sh
```

Run the directory automation:

```bash
./scripts/directory_setup.sh
```

Run the idempotency demonstration:

```bash
./scripts/idempotent_setup.sh
```

Run the system health monitor:

```bash
./scripts/health_monitor.sh
```

Run the functions demonstration:

```bash
./scripts/functions.sh
```

Run the modular monitor:

```bash
./scripts/modular_monitor.sh
```

Run the safety and validation demonstration:

```bash
./scripts/safe_script.sh
```

---

# Learning Outcomes

On completion of this project, the following Bash and DevOps concepts have been demonstrated:

* Linux command-line usage
* Bash scripting
* Variables
* Command substitution
* Conditional statements
* Exit codes
* Functions
* Function arguments
* Local variables
* External libraries
* `source`
* Filesystem automation
* Idempotency
* System monitoring
* Input validation
* Defensive programming
* `set -e`
* `set -u`
* `set -o pipefail`
* `trap`
* Temporary resource cleanup
* Bash syntax validation
* Git
* GitHub
* Professional repository organisation

---

# DevOps Relevance

Bash scripting is a fundamental skill for Linux and DevOps engineering.

The techniques demonstrated in this project can be extended into more advanced automation involving:

* CI/CD pipelines
* Jenkins
* GitHub Actions
* Docker
* Kubernetes
* Cloud infrastructure
* Configuration management
* Server provisioning
* Monitoring and health checks
* Deployment automation

The project therefore provides a foundation for progressing from basic Linux administration into more advanced DevOps automation.

---

# Project Status

**Status: Completed**

The project includes:

* [x] Bash scripts
* [x] Filesystem automation
* [x] Idempotent automation
* [x] System monitoring
* [x] Bash functions
* [x] External function library
* [x] Input validation
* [x] Defensive scripting
* [x] Signal handling
* [x] Cleanup
* [x] Syntax testing
* [x] Documentation
* [x] Screenshots
* [x] Git version control
* [x] GitHub repository

---

## Author

**John Salubi**

Bash Linux Automation Project — DevOps / Linux Automation Practice
