## How to declare them?

## Varialbes decleration has to have the dollar sign $.
## Poweshell has different data types, you can play around with it using the .GetType() which is a built-in method.
## Powershell doesn't require you to specifiy a data type before declaring. Similar to Python
$myVarialbe="Ibrahim Baatiah"
$myVarialbe.GetType()

## You can also perform different oprations on the varialbes:
$myValue1=1
$myValue5=5
$myValue10=10
## You can do +, -, /, %.....etc
$myResult=$myValue5+$myValue10
$myResult

## You can also have boolean types $true & $false
$myStatement=$true
$myStatement.GetType()

## You can do statements (not varialbes)..... -eq -> ==
($myValue1 -eq $myValue5)

## You also have null:
$null

## You can cast varialbes.
[int]$castValue=1.2
$castValue
$castValue.GetType()

