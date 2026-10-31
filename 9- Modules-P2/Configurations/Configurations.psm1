##############################
####### Configurations #######
##############################

## PSM -> PowerShell Module file.
function Get-Configuration {
    <#
        .DESCRIPTION
        This is the description for Get-Configuration, written by me

        .EXAMPLE
        Get-Configuration
        This will return all the configs

        .LINK
        This is a link to my GitHub for more info on this module
    #>
    [CmdletBinding()]
    Param ()
    Write-Output "Get-Configuration Function"
}

function Set-Configuration {
    [CmdletBinding()]
    Param ()

    Write-Output "Set-Configuration Function"
}
