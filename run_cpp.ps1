# Powershell Script to compile and run C/C++ programs, display output, and delete the executable.
# Usage: ./run_code.ps1 filename.c or filename.cpp


# Check if the filename is provided as an argument
if ($args.Count -eq 0) {
    Write-Host "Usage: ./script.ps1 filename.c or filename.cpp"
    exit 1
}

# Extract filename and extension
$filename = [System.IO.Path]::GetFileNameWithoutExtension($args[0])
$extension = [System.IO.Path]::GetExtension($args[0]).TrimStart('.')

# Check if the file exists
if (-not (Test-Path $args[0])) {
    Write-Host "Error: File '$args[0]' not found!"
    exit 1
}

# Compile based on the file extension
if ($extension -eq "cpp") {
    # Compile C++ program
    g++ $args[0] -o "$filename.exe"
} elseif ($extension -eq "c") {
    # Compile C program
    gcc $args[0] -o "$filename.exe"
} else {
    Write-Host "Error: Only .c or .cpp files are supported!"
    exit 1
}

# Check if the compilation was successful
if ($LASTEXITCODE -eq 0) {
    Write-Host "Compilation successful. Running the program..."
    
    # Run the program using the full executable path
    Start-Process -FilePath ".\${filename}.exe" -NoNewWindow -Wait
    
    # Print a blank line before showing "Executable deleted."
    Write-Host ""

    # Delete the executable after running
    Remove-Item "$filename.exe"
    Write-Host "Executable deleted."
} else {
    Write-Host "Compilation failed!"
    exit 1
}
