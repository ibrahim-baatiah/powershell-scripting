<#
    How to read JSON in PowerShell?
    1. As always get the file path
    2. Get-Content here will retrieve the full file without reading its 
        properties properly. You need to add ConvertFrom-Json flag
    3. Now it saves each object in the JSON one by one, but I have only one, and it's an Array.
    4. You can specify a property and save it to a varialbe (in my case is employee).
    5. Now you have the employees list from the JSON.
    6. You can now treat it as any other Array, and filter it.
#>
$jsonFile = 'C:\Users\ibrahim\Developer\Poweshell\12- Files\JSON\employees.json'

$jsonData = Get-Content -Path $jsonFile | ConvertFrom-Json

$jsonEmployee = $jsonData.Employee # Now it shows the Employees properly
$jsonEmployee.GetType() # -> System.Array
$jsonEmployee | Where-Object Title -eq "Engineer"

<#
    ### Converting CSV into JSON ###
#>

# Get the file
$csvFile = 'C:\Users\ibrahim\Developer\Poweshell\12- Files\JSON\employee.csv'

# Read it
$csvData = Import-Csv -Path $csvFile

# Save it to JSON
$csvData | ConvertTo-Json | Out-File 'C:\Users\ibrahim\Developer\Poweshell\12- Files\JSON\exportedJSON.json'

<#
    You will mostly deal with JSON when contacting APIs. Below is an example from an API
#>
# This is our new "Path", but it's online.
$uri = 'https://api.restcountries.com/countries/v5?limit=100&api-key=rc_live_demo'

# Same as Import-Cvs but here the web way
$webReq = Invoke-WebRequest -Uri $uri -Method Get # This return the full response
## Here we get JSON response, but it's messy. To show it in an orginized way add "ConvertFrom-Json"
($webReq.Content | ConvertFrom-Json).data.objects.names ## Here we can specify one field of the response.