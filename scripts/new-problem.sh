#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 \"<problem-name>\" <easy|medium|hard>"
    exit 1
fi

name="$1"
difficulty="$(printf '%s' "$2" | tr '[:upper:]' '[:lower:]')"

case "$difficulty" in
    easy|medium|hard)
        ;;
    *)
        echo "Error: difficulty must be easy, medium, or hard."
        exit 1
        ;;
esac

slug=$(printf '%s' "$name" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]\+/-/g' | sed 's/^-//;s/-$//')

if [ -z "$slug" ]; then
    echo "Error: problem name cannot be empty."
    exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root="$(dirname "$script_dir")"

problem_path="$project_root/$difficulty/$slug"

template_solution="$project_root/templates/solution.cpp"
template_notes="$project_root/templates/notes.md"

if [ -e "$problem_path" ]; then
    echo "Error: problem already exists: $difficulty/$slug"
    exit 1
fi

mkdir -p "$problem_path"

cp "$template_solution" "$problem_path/sol.cpp"
cp "$template_notes" "$problem_path/notes.md"

echo "Created problem: $difficulty/$slug"