## There's 2 types of error handling in PowerShell, terminating and non-terminating errors. 
## Terminating errors are those that stop the execution of the script, while non-terminating errors allow the script to continue executing. 
## You can use try/catch blocks to handle terminating errors, and you can use the -ErrorAction parameter to handle non-terminating errors.

$ErrorActionPreference = "Stop" ## This will make all errors terminating errors, so that they can be caught by the try/catch block.

try {
    $filePath = "C:\path\to\your\file.txt"
    $files = Get-ChildItem -Path $filePath -ErrorAction Stop ## You can remove the -ErrorAction Stop parameter, and the script will continue executing even if the file path is invalid. But since we have set the $ErrorActionPreference to "Stop", it will still be a terminating error.

    $files.forEach({
        Write-Output $_.Name
    })

    Write-Output "This is after the error"
} catch {
    Write-Output $_.Exception.Message
} finally {
    Write-Output "This is the finally block, it will always execute regardless of whether an error occurred or not."
}

$Error[0] ## This will return the most recent error that occurred in the script. You can also use $Error[1], $Error[2], etc. to access previous errors.