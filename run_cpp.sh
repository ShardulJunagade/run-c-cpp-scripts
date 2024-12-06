#!/bin/bash
# Bash Script to compile and run C/C++ programs, display output, and delete the executable.
# Usage: ./run_code.sh filename.c or filename.cpp

# Check if the filename is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename.c or filename.cpp"
    exit 1
fi

# Extract filename and extension
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found!"
    exit 1
fi

# Compile based on the file extension
if [ "$extension" == "cpp" ]; then
    # Compile C++ program
    g++ "$1" -o "$filename"
elif [ "$extension" == "c" ]; then
    # Compile C program
    gcc "$1" -o "$filename"
else
    echo "Error: Only .c or .cpp files are supported!"
    exit 1
fi

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Running the program..."
    ./"$filename"
    
    # Print a blank line before showing "Executable deleted."
    printf "\n"
    
    # Delete the executable after running
    rm "$filename"
    echo "Executable deleted."
else
    echo "Compilation failed!"
    exit 1
fi
