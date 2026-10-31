<#
    How to read data from CSV files?
    PowerShell makes it very easy for you.
    1. Get the file path
    2. Save the data in the CSV into a varialbe, using "Import-Csv".
    3. Now you have it, you can do whatever... for loop, manupilate.. etc.
#>


$csvFilePath = 'C:\Users\ibrahim\Developer\Poweshell\12- Files\CSV files\commatest.csv'

$employeeData = Import-Csv -Path $csvFilePath
<#
    empolyeeData output:
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
    By default these fucntions are expecting a "," as a delimeter.
    If your CSV has a different you need to specify it using the "-Delimeter" flag.
    This is what the output would look like:
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

<#
    ### EXPORTING CSVs ###
    This is a very useful and important features in PowerShell. Not just reading CSVs,
    You can also retieve data from Windows and export it/save it in a CSV file.
    In the below example, we will save all of our service into a CSV,
    but the interesting part is, we can include an epxperssion and add custom columns to our needs.
    Like below, we created an experssion to add a time column alongside the defualt properties of a service,
    so now both are going to be saved.
#>

Get-Service | Select-Object -Property Name,DisplayName,Status,StartType,@{Name='Time';Expression={Get-Date -Format 'dd-MM-yyy hh:mm:ss'}} | Export-Csv "C:\Users\ibrahim\Developer\Poweshell\12- Files\CSV files\services-exported.csv" -Delimiter "," -NoTypeInformation