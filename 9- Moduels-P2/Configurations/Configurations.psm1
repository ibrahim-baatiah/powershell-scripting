### PSM -> PowerShell Module file.
function Get-Confugration {
    <#
        .DESCRIPTION
        This is the description for the get-configrauton written by me

        .EXAMPLE
        get-configruation
        This will return all the configs

        .LINK
        This is a link to my github for more info on this module
    #>
    [CmdletBinding()]
    Param ()
    Write-Output "Get-Configuration Function"
}

function Set-Confugration {
    [CmdletBinding()]
    Param ()

    Write-Output "Set-Configuration Function"
}