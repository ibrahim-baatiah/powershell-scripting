########################
####### Remoting #######
########################

$env:COMPUTERNAME ## This just shows the name of the computer

<#
    The main thing about remoting is the "Code Block". You may wonder, what is a code block?
    I'll tell ya!!
    It's simply a piece of script/code saved to a variable. That's it. Like the below.
    But remember, it's important to add "&" before calling the variable, so it just executes the script within.
#>
$test={
    Write-Output "This is the test"
}

Write-Output "This is without '&'"
$test ## Write-Output "This is the test"
Write-Output "And this one has it"
& $test ## This is the test

Write-Output "#####################################################################"

$Creds=Get-Credential

<#
    Will the below variable work in the code block running remotely?
    The output: This is running from DC01 and
    There's a blank. someVar exists on my machine, not the remote one.
    Hence the remote one doesn't have the reference to my local var.
#>
$someVar="This is running from my Windows VM on Omarchy."
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    Write-Output "This is running from $($env:COMPUTERNAME) and $($someVar)"
}

<#
    In order for local vars to work on the remote machine, we need to pass them as arguments,
    as in function arguments. They're treated as an array, so in case you want to reference them on
    the remote machine, you will need to use the args variable, and the indexes args[0], args[1]..... args[n].
#>
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    Write-Output "This is running from $($env:COMPUTERNAME) and $($args[0])"
} -ArgumentList $someVar
<#
    Now the above code will include my local var in the remote one:
    The block output: This is running from DC01 and This is running from my Windows VM on Omarchy.
    Another way of doing it is to use the "using" keyword to include a local variable, example below:
#>
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    Write-Output "This is running from $($env:COMPUTERNAME) and $($using:someVar)"
}

<#
    How to do it the other way around? Getting back values from the remote session?
    It's simple, you can wrap your whole Invoke-Command into a variable and use it.
    Example below:
#>
$users=Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    get-aduser -filter *
}
$users | select Name


<#
    Instead of using Invoke-Command, another way is to create a session, and log in to that session.
    What difference does it make, as long as both are connecting me to the same remote host... you may ask.
    Persistent Session, that's why. But what is it exactly?
    Right now, if you created a variable, let's say in a block, you can only access it from that block.
    But with a Persistent Session, if you're using the same session you can see anything you created.
    Let's take an example:
#>
## First we start with Invoke-Command
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    $test="This is a test for Invoke-Command persistence!"
}
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    $test
}
<#
    As you might think, nothing was printed on the terminal, because my 2nd block
    isn't aware of the 1st one. Hence it has no idea what $test is.
    How to fix it? Here is where Sessions come in handy.
#>

## This is how to create a session
$session=New-PSSession -ComputerName "100.121.11.94" -Credential $Creds

Invoke-Command -Session $session -ScriptBlock {
    $test="This is a test for Sessions persistence!"
}

Invoke-Command -Session $session -ScriptBlock {
    $test
}

<#
    Now with Sessions, it actually remembers the $test from the previous block,
    because we are using the same session, kind of the same connection.
    This is the output: This is a test for Sessions persistence!
#>

## To check if you have any sessions:
Get-PSSession

## After finishing with your session, you can disconnect:
Disconnect-PSSession -Session $session

## Disconnecting keeps it there, but you can completely remove it by:
Remove-PSSession -Session $session

## To save time, you can just pipe all of them in one command.
## This will disconnect and remove all sessions:
Get-PSSession | Disconnect-PSSession | Remove-PSSession
