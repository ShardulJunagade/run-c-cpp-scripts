# C/C++ Program Runner Scripts

This repository contains scripts for compiling and running C/C++ programs seamlessly across different platforms. Each script performs the following tasks:
1. Compiling the given `.c` or `.cpp` file.
2. Running the compiled executable.
3. Displaying the program's output.
4. Deleting the executable after execution.

## Features
- Supports both `.c` and `.cpp` files.
- Automatic cleanup of compiled executables.
- Error handling for missing files or unsupported extensions.
- Cross-platform support.

## Prerequisites
- **GNU Compiler Collection (GCC)** or **G++** installed on your system.
- Ensure the scripts are executable (e.g., `chmod +x run_cpp.sh` for Bash).


## Scripts Overview

### 1. Bash Script (`run_cpp.sh`)
- Platform: Unix-like systems (Linux, macOS)
- Usage: 
    ```bash
    run_cpp.sh filename.c
    run_cpp.sh filename.cpp
    ```


### 2. PowerShell Script (`run_cpp.ps1`)
- Platform: Windows
- Usage:
    ```powershell
    run_cpp.ps1 filename.c
    run_cpp.ps1 filename.cpp
    ```

### 3. Batch Script (`run_cpp.bat`) for CMD
- Platform: Windows
- Usage:
    ```cmd
    run_cpp.bat filename.c
    run_cpp.bat filename.cpp
    ```
An `example.cpp` file has been included in the repository. You can use this file to test or verify that the scripts are working as expected.

## Making the Scripts Globally Executable

To simplify usage, you can add the script's directory to your system's `PATH`. This allows you to run the script directly from anywhere using:
```
run_cpp filename.c
run_cpp filename.cpp
```

**Note:** In Windows, this behavior depends on your environment configuration. If it doesn’t work, use the full script name (run_cpp.ps1 or run_cpp.bat) depending on your terminal.



## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
