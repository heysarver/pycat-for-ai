#!/bin/bash
pycat_for_ai() {
    local search_dir="${1:-$(pwd)}"

    # Use find to locate the files while excluding the specified directories and files
    find "$search_dir" -type f \( \
        -path '*/.git/*' -o \
        -path '*/venv/*' -o \
        -path '*/.venv/*' -o \
        -name "*.env" -o \
        -name "*.pyc" -o \
        -path '*/__pycache__/*' \
    \) -prune -o -type f -print | while read -r file; do
        # Remove leading './' if it exists
        relative_file="${file/#.\//}"
        echo -e "\n==> $relative_file <==\n"
        cat "$file"
    done
}
