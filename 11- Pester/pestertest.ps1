###########################
####### Pester Test #######
###########################

<#
    The tests below will take the computer name and credentials as input,
    which makes them a very good choice to use against different machines, and remotely.

    Describe, Context, It & Should be.
    All of them are Pester keywords.
#>
param (
    $ComputerName,
    $Creds
)


Describe "Testing services on the server" {
    Context "Checking services" {
        It "Making sure print spooler is stopped" {
            $Service=Invoke-Command -ComputerName $ComputerName -Credential $Creds -ScriptBlock {
                Get-Service Spooler
            }
            $Service.status | Should be 'Stopped'
        }
    }
}
