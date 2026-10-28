########################
## Array vs ArrayList ##
########################

$myArray=@("Test1", "Test2", "Test3")
$myArray.GetType() ## System.Array
$myArray.IsFixedSize ## True

$myArray.Count
$myArray.Length
$myArray ## Print the whole array

$myArray[1] ## Print element by index

## 2 Ways to add new things:
$myArray=$myArray+"Test4"

$myArray+="Test5"

$myArray ## Inlcudes Test4 and 5

## Remove item
$myArray=$myArray -ne "Test2" ## -ne -> Not equal -> !=

$myArray


##### ArrayList #####

$myList1=[System.Collections.ArrayList]@() ## This is the bad way of creating it
$myList=New-Object -TypeName System.Collections.ArrayList ## This is a good way.

$myList1.GetType()
$myList.GetType() ## Both the same

## Here we can use the add() method.
$myList.add("Test1") ## Normally the fuction returns the index of the new added item.
[void]$myList.add("Test2") ## To prevent that you cast it to void (I guess you cast the return type of the method to void).
$myList.AddRange(@("Test3", "Test4", "Test5", "Test2")) ## Adds multiple items at once

$myList.Remove("Test2") ## Remove, only removes the 1st instance of the item
$myList.RemoveAt() ## Remvoes at index
$myList.RemoveRange() ## Takes starting & ending index. Remvoes everthing including the starting and finishing points.

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