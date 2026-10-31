$env:COMPUTERNAME ## This just shows the name of the computer

<#
    The main thing about remoting is "Code Block". You may wonder what is a code block?
    I'll tell ya!!
    It's simple a piece of script/code saved to a varialbe. That's it. Like the below.
    But remember, it's important to add "&" before calling the variable, so it just execute the script within
#>
$test={
    Write-Output "This is the test"
}

$test ## Write-Output "This is the test"
Write-Output "This is without '&'"
& $test ## This is the test
Write-Output "And this one has it"

Write-Output "#####################################################################"

$Creds=Get-Credential

<#
    Will below variable work on the code block running remotly?
    The output: This is running from DC01 and 
    There's a blank, someVar exist on my machine, not the remote one. 
    Hence the remote one doesn't have the referrence to my local var.
#>
$someVar="This is running from my Windows VM on Omarchy." 
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    Write-Output "This is running from $($env:COMPUTERNAME) and $($someVar)"
}

<#
    In order for local vars to run on the remote machine we need to pass them as arguments,
    As in a function arguments, and it's treaded as an array in case you want to referrence them in
    the remote machine, will need to use args varialbe, and the indexes agrs[0], args[1]..... args[n].
#>
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    Write-Output "This is running from $($env:COMPUTERNAME) and $($args[0])"
} -ArgumentList $someVar
<#
    Now the above code will include my local var in the remote one:
    The block output: This is running from DC01 and This is running from my Windows VM on Omarchy.
    Another way of doint it is to use "using" keyworkd to include a local varialbe, example below:
#>
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    Write-Output "This is running from $($env:COMPUTERNAME) and $($using:someVar)"
} 

<#
    How to do it the other way around? Getting back values from the remote session?
    It's simple, you can wrap your whole Invoke-Command into a variable and use.
    Example below:
#>
$users=Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    get-aduser -filter *
} 
$users | select Name


<#
    Instead of using Invoke-Command, another way is to create a session, and log in to that session.
    What difference does it make? as long as both connecting me to the same remote host... you may ask.
    Persistant Session, that's why. But what is it exactly?
    Right now, if you created a variable let's say in a block, you can only access it from that block.
    But with Persistant Session, if you're using the same session you can see anything you created.
    Let's take an example:
#>
## First we start with Invoke-Command
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    $test="This is a test for Invoke-Command persistance!"
}
Invoke-Command -ComputerName "100.121.11.94" -Credential $Creds -ScriptBlock {
    $test
}
<#
    As you might think, nothing was printed on the terminal, becuase my 2nd block
    isn't aware of the 1st one. Hence it has no idea what is $test.
    How to fix it? Here Sessions comes in handy
#>

$session=New-PSSession -ComputerName "100.121.11.94" -Credential $Creds
## This is how to create a session

Invoke-Command -Session $session -ScriptBlock {
    $test="This is a test for Sessions persistance!"
}

Invoke-Command -Session $session -ScriptBlock {
    $test
}

<#
    Now with Sessions, it actually remembers the $test from the previous block.
    Becuase we are using the same session, kind of the same connetion. 
    This is the output: This is a test for Sessions persistance!
#>

# To check if you have an sessions:
Get-PSSession

# After finishing with your session, you can disconnect:
Disconnect-PSSession -Session $session

# Diconnect, but it will still be there, you can completly remove it by:
Remove-PSSession -Session $session

# To save that, you can just pipe all of them in one command
Get-PSSession | Disconnect-PSSession | Remove-PSSession
# This will doconnect and remove all sessions