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

<#
    The tests above will take the computer name and credentials as input.
    Which makes a very good choice to use it against different machines and remotely.
    ##################################3
    Describe, Context It & Should be.
    All of them are Pester keywords
#>