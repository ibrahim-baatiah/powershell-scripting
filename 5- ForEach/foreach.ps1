$filePath = "C:\Users\azureuser\Developer\Powershell\5- ForEach\Data\FolderNames.txt"
$folderPath = "C:\Users\azureuser\Developer\Powershell\5- ForEach\Data\Share"
$folderNames = Get-Content -Path $filePath

## There's 3 ways in which you can establish a loop in PowerShell. The first is the ForEach loop, and the second is the ForEach-Object cmdlet. 
## Both methods are used to iterate over a collection of items, but they have different use cases and syntax.

foreach ($name in $folderNames) {
    if (Test-Path -Path "$folderPath\$name") {
        Write-Host "Folder '$name' already exists."
    } else {
        New-Item -Path "$folderPath\$name" -ItemType Directory
        Write-Host "Folder '$name' created."
    }
}

$folderNames | ForEach-Object -Process {
    if (Test-Path -Path "$folderPath\$_") {
        Write-Host "Folder '$_' already exists."
    } else {
        New-Item -Path "$folderPath\$_" -ItemType Directory
        Write-Host "Folder '$_' created."
    }
}

## Just for the sake of simplicity, below I wrote a ForEach loop in both fasions that will just print the elements of the array. Very general.
foreach ($name in $folderNames) {
    Write-Host "Folder Name: $name"
}

$folderNames | ForEach-Object -Process {
    Write-Host "Folder Name: $_"
}

$folderNames.ForEach({
    Write-Host "Folder Name: $_"
})