# Problem Solving Workspace

This workspace is organized by difficulty so you can create a new problem in one command and start solving immediately.

## Folder structure

- easy/
- medium/
- hard/
- templates/
- scripts/

Each new problem gets:

- a difficulty folder
- a slugged problem name folder
- a starter solution file: sol.cpp
- a notes template: notes.md

## Quick start

From the project root, run:

- Bash / Git Bash:
  ./new-problem "Problem Name" easy

- PowerShell / Command Prompt:
  new-problem "Problem Name" easy

If the command is not found in your shell, add the workspace root to PATH:

- Bash / zsh:
  export PATH="$PWD:$PATH"

- PowerShell:
  $env:Path = "$PWD;$env:Path"

## Supported difficulties

- easy
- medium
- hard

The script normalizes the name and difficulty, so values like "Easy" or "PROBLEM NAME" still work.

## Example

./new-problem "Two Sum" easy

This creates:

easy/two-sum/
  - sol.cpp
  - notes.md
