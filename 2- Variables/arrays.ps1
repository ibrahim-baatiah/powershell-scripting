##################################
####### Array vs ArrayList #######
##################################

##### Array #####

$myArray=@("Test1", "Test2", "Test3")
$myArray.GetType() ## System.Array
$myArray.IsFixedSize ## True

$myArray.Count
$myArray.Length
$myArray ## Prints the whole array

$myArray[1] ## Prints an element by index

## 2 ways to add new things:
$myArray=$myArray+"Test4"
$myArray+="Test5"

$myArray ## Includes Test4 and 5

## Remove an item
$myArray=$myArray -ne "Test2" ## -ne -> Not equal -> !=

$myArray


##### ArrayList #####

$myList1=[System.Collections.ArrayList]@() ## This is the bad way of creating it
$myList=New-Object -TypeName System.Collections.ArrayList ## This is a good way

$myList1.GetType()
$myList.GetType() ## Both are the same

<#
    Here we can use the Add() method.
    Normally the function returns the index of the newly added item.
    To prevent that, you cast it to void (I guess you cast the return type of the method to void).
#>
$myList.add("Test1")
[void]$myList.add("Test2")
$myList.AddRange(@("Test3", "Test4", "Test5", "Test2")) ## Adds multiple items at once

$myList.Remove("Test2") ## Remove only removes the 1st instance of the item
$myList.RemoveAt() ## Removes at index
$myList.RemoveRange() ## Takes starting & ending index. Removes everything, including the starting and finishing points.


##### Speed Test #####

$array=@()
Measure-Command -Expression {
    @(0..500000).ForEach(({$array+=$_})) ## It took 6 min & 59 sec & 843 milliseconds
}

$arrayList=New-Object -TypeName System.Collections.ArrayList
Measure-Command -Expression {
    @(0..500000).ForEach(({$arrayList.Add($_)})) ## It took 1 sec & 730 milliseconds
}

$arrayList=New-Object -TypeName System.Collections.ArrayList
Measure-Command -Expression {
    $arrayList.AddRange(@(0..500000)) ## It took 139 milliseconds
}
