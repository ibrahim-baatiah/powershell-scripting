#########################
####### CSV Files #######
#########################

##### Reading CSVs #####

<#
    How to read data from CSV files?
    PowerShell makes it very easy for you.
    1. Get the file path.
    2. Save the data in the CSV into a variable, using "Import-Csv".
    3. Now you have it, you can do whatever... for loop, manipulate... etc.
#>

$csvFilePath = 'C:\Users\ibrahim\Developer\Poweshell\12- Files\CSV files\commatest.csv'

$employeeData = Import-Csv -Path $csvFilePath
<#
    employeeData output:
    #########################################
    ### id name          title    country ###
    ### -- ----          -----    ------- ###
    ### 1  John Smith    Engineer Poland  ###
    ### 2  Anna Kowalska Manager  Germany ###
    ### 3  Mark Brown    Analyst  USA     ###
    #########################################
#>
foreach ($employee in $employeeData) {
    Write-Output "$($employee.title). $($employee.name) is from $($employee.country)"
}

<#
    By default these functions are expecting a "," as a delimiter.
    If your CSV has a different one, you need to specify it using the "-Delimiter" flag.
    Otherwise, this is what the output would look like:
    #########################################
    ### id;name;title;country             ###
    ### ---------------------             ###
    ### 1;Ibrahim Baatiah;Engineer;Yemen  ###
    ### 2;Anna Kowalska;Manager;Germany   ###
    ### 3;Mark Brown;Analyst;USA          ###
    #########################################
#>
$csvFilePath1 = 'C:\Users\ibrahim\Developer\Poweshell\12- Files\CSV files\semitest.csv'

$employeeData1 = Import-Csv -Path $csvFilePath1 -Delimiter ";"

##### Exporting CSVs #####

<#
    This is a very useful and important feature in PowerShell. Not just reading CSVs,
    you can also retrieve data from Windows and export it/save it in a CSV file.
    In the below example, we will save all of our services into a CSV,
    but the interesting part is, we can include an expression and add custom columns to our needs.
    Like below, we created an expression to add a time column alongside the default properties of a service,
    so now both are going to be saved.
#>

Get-Service |
    Select-Object -Property Name,DisplayName,Status,StartType,@{Name='Time';Expression={Get-Date -Format 'dd-MM-yyy hh:mm:ss'}} |
    Export-Csv "C:\Users\ibrahim\Developer\Poweshell\12- Files\CSV files\services-exported.csv" -Delimiter "," -NoTypeInformation
