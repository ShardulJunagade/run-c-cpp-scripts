@echo off
:: Batch Script (CMD) to compile and run C/C++ programs, display output, and delete the executable.
:: Usage: run_code.bat filename.c or filename.cpp


:: Check if the filename is provided
if "%~1"=="" (
    echo Usage: run_code.bat filename.c or filename.cpp
    exit /b 1
)

set filename=%~n1
set extension=%~x1

:: Check if the file exists
if not exist "%~1" (
    echo Error: File "%~1" not found!
    exit /b 1
)

:: Compile based on the file extension
if "%extension%"==".cpp" (
    g++ "%~1" -o "%filename%"
) else if "%extension%"==".c" (
    gcc "%~1" -o "%filename%"
) else (
    echo Error: Only .c or .cpp files are supported!
    exit /b 1
)

:: Check if compilation succeeded
if errorlevel 1 (
    echo Compilation failed!
    exit /b 1
)

echo Compilation successful. Running the program...
"%filename%"

:: Print a blank line for better output separation
echo.

:: Delete the executable after running
del "%filename%.exe"
echo Executable deleted.
