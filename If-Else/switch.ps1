$filePath=".\If-Else\Data\test.txt"

$data=Get-Content -Path $filePath

$firstName=$data[0]

if ($firstName -eq "Tim") {
    Write-Output "My name is Tim"
} elseif ($firstName -eq "Ibrahim") {
    Write-Output "My name is Ibrahim"
} elseif ($firstName -eq "Richard") {
    Write-Output "My name is Richard"
} else {
    Write-Output "I don't know my name"
}

switch ($firstName) {
    "Tim" {
        Write-Output "My name is Tim"
        break
    }
    "Ibrahim" {
        Write-Output "My name is Ibrahim"
        break
    }
    "Richard" {
        Write-Output "My name is Richard"
        break
    }
    default {
        Write-Output "I don't know my name"
        break   
    }
}

switch ($data.Count) {
    {$_ -lt 2} {
        Write-Output "I don't know my name"
    }
    {$_ -eq 7} {
        Write-Output "I don't know my name"
    }
    {$_ -lt 10} {
        Write-Output "I don't know my name"
    } 
    default {
        Write-Output "I don't know my name"
    }
}