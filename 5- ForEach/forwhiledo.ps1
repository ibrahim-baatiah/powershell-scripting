## For (condition; increment) { statement(s) }
## while (condition) { statement(s) }
## do { statement(s) } while (condition)


for ($i=0; $i -lt 10; $i=$i+2) {
    Write-Host "Iteration: $i"
}

$testArray=@("Steve", "John", "Mary", "Jane")

for ($i=0; $i -lt $testArray.Length; $i++) { ## This one can actually modify the array elements, because we are using the index to access the elements of the array.
    $testArray[$i] += " Smith"
}

foreach ($name in $testArray) { ## This one cannot modify the array elements, because we are using a copy of the element in the array, not the actual element itself. So any changes made to $name will not affect the original array.
    $name += " Doe"
}

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
