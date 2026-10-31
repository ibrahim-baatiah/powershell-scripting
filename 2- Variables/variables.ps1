#########################
####### Variables #######
#########################

<#
    How to declare them?
    Variable declaration has to have the dollar sign $.
    PowerShell doesn't require you to specify a data type before declaring. Similar to Python.
    PowerShell has different data types, you can play around with them using .GetType(), which is a built-in method.
#>
$myVariable="Ibrahim Baatiah"
$myVariable.GetType()

## You can also perform different operations on the variables:
$myValue1=1
$myValue5=5
$myValue10=10
## You can do +, -, /, %..... etc.
$myResult=$myValue5+$myValue10
$myResult

## You can also have boolean types, $true & $false
$myStatement=$true
$myStatement.GetType()

## You can do statements (not variables)..... -eq -> ==
($myValue1 -eq $myValue5)

## You also have null:
$null

## You can cast variables.
[int]$castValue=1.2
$castValue
$castValue.GetType()
