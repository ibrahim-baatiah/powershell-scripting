###########################################
####### HashTables & Custom Objects #######
###########################################

##### HashTables #####

$myHashTable=@{
    key1=100
    apple=2.34
    name="Ibrahim Baatiah"
    key2=2
    key3=$true
}

# $myHashTable.GetType()
# $myHashTable.Keys ## Get keys
# $myHashTable.Values ## Get values

$myHashTable.apple ## Get a value from a key
$myHashTable['key3'] ## Same thing, different way. Get a value from a key

$myHashTable.ContainsKey('key4') ## False, checks if a key exists
$myHashTable.ContainsValue(2.34) ## True, checks if a value exists

$myHashTable.Add('test5', 55)
$myHashTable['test6'] = "Another way of adding items"
$myHashTable.test7="Another way to add, these are 3 methods to add items to a HashTable"

$myHashTable
$true
$myHashTable.apple=0.5 ## Change
$myHashTable
$true
$myHashTable.apple="Apple"
$myHashTable
$true
$myHashTable.Remove('apple') ## Remove


##### Objects #####

$employee1=New-Object -TypeName PSCustomObject

Add-Member -InputObject $employee1 -MemberType NoteProperty -Name "Employee ID" -Value "1001"
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name "FirstName" -Value "Ibrahim"
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name "Title" -Value "CEO"

# $employee1
# $employee1.FirstName

# Get-Member -InputObject $employee1

$employee2=[PSCustomObject]@{
    EmployeeID='1002'
    FirstName='Hussein'
    Title='Tea Boy'
}

$employee2
