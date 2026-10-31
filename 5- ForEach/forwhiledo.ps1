###############################################
####### For, While, Do-While & Do-Until #######
###############################################

<#
    For (condition; increment) { statement(s) }
    while (condition) { statement(s) }
    do { statement(s) } while (condition)
#>


##### For #####

for ($i=0; $i -lt 10; $i=$i+2) {
    Write-Host "Iteration: $i"
}

$testArray=@("Steve", "John", "Mary", "Jane")

<#
    This one can actually modify the array elements, because we are using the index to access the elements of the array.
#>
for ($i=0; $i -lt $testArray.Length; $i++) {
    $testArray[$i] += " Smith"
}

<#
    This one cannot modify the array elements, because we are using a copy of the element in the array, not the actual element itself.
    So any changes made to $name will not affect the original array.
#>
foreach ($name in $testArray) {
    $name += " Doe"
}


##### While #####

<#
    The While loop will continue to execute the code block as long as the condition is true.
    In this case, it will keep printing the current time until the minute is no longer 32.
#>
Get-Date
while ((get-Date).Minute -eq 32) {
    Write-Host "Current time: $(get-Date)"
}

Write-Output "Welcome to the Do While loop"
Write-output "Press q to Quit"
$input = Read-Host "Enter your choice: "
While ($input -ne 'q') {
    Write-Output "You entered: $input"
    $input = Read-Host "Enter your choice: "
}


##### Do-While #####

<#
    It will for sure execute the code block at least once, and then check the condition.
    If the condition is true, it will continue to execute the code block until the condition is false.
#>
Write-Output "Welcome to the Do While loop"
Write-output "Press q to Quit"
do {
    $input = Read-Host "Enter your choice: "
    if ($input -ne 'q') {
        Write-Output "You entered: $input"
    }
} While ($input -ne 'q') ## Will be false when the user enters 'q', and the loop will exit.


##### Do-Until #####

<#
    The Do-Until loop will execute the code block at least once, and then check the condition.
    If the condition is false, it will continue to execute the code block until the condition is true.
#>
Write-Output "Welcome to the Do While loop"
Write-output "Press q to Quit"
do {
    $input = Read-Host "Enter your choice: "
    if ($input -ne 'q') {
        Write-Output "You entered: $input"
    }
} until ($input -eq 'q') ## Will be true when the user enters 'q', and the loop will exit.
