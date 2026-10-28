#######################
####### If Else #######
#######################

## Not all normal operators works in Powershell
## 1 < 2 doesn't work
## 1 == 2 also doesn't work

## So, how to use conditions in Powershell?
## You can add a dash "-" and a whole list of operators will show up
1 -eq 1 # Equals
1 -lt 2 # Less than
1 -le 2 # Less than or equals too
2 -gt 1 # Greater than
2 -ge 2 # Greater or equals too
1 -ne 3 # Not equal

Write-Output("#####################################################")

@(1,2,3) -contains 2
@("Test", "test") -contains 'TEST' # Contains is not case sensitive - True
@("Test", "test") -ccontains 'TEST' ## C-Contains is case sensitive - False

'Test' -eq "TEST" # True - Not Case sensitive
'Test' -ceq "TEST" # False - Case sensitive

Write-Output("#####################################################")

$filePath="C:\Users\ibrahim\Developer\Poweshell\If-Else\Data\text.txt"
# Test-Path -Path $filePath

if (Test-Path -Path $filePath) {
    Write-Output "File Exists!!!"
    $data = Get-Content -Path $filePath
    $data.Count
    if ($data.Count -lt 2) {
        Write-Output "This file has less than 2 lines"
    } elseif ($data.Count -lt 4) {
        Write-Output "This file has less than 4 lines but at least 2"
    } else {
        Write-Output "This file has 4 or more lines"
    }
    Write-Output "This is after the if statement"
} else {
    Write-Output "File $filePath does not exist!" ## You can use variables only inside douple quotes.
}