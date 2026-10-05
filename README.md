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
    ```Bash
  ./new-problem "Problem Name" easy
  ```
  ```PS
- PowerShell / Command Prompt:
  new-problem "Problem Name" easy
  ```
If the command is not found in your shell, add the workspace root to PATH:

- Bash / zsh:
  ```Bash
  export PATH="$PWD:$PATH"
  ```

- PowerShell:
  ```PS
  $env:Path = "$PWD;$env:Path"
  ```
## Supported difficulties

- easy
- medium
- hard

The script normalizes the name and difficulty, so values like "Easy" or "PROBLEM NAME" still work.

## Example

./new-problem "Two Sum" easy

This creates:

- easy/two-sum/
  - sol.cpp
  - notes.md

Example output:

```txt
Created problem: easy/two-sum
```

## Template feature

Every newly created problem starts from the template files in the `templates/` folder.

- `templates/solution.cpp` is copied into the new problem as `sol.cpp`
- `templates/notes.md` is copied into the new problem as `notes.md`

That means each solution file already has a minimal C++ starter structure ready to use:

```cpp
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <unordered_map>
#include <unordered_set>

using namespace std;

int main() {

    return 0;
}
```

This saves time so you can jump straight into solving instead of rewriting the basic includes and `main()` every time.
