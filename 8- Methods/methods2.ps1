############################################
####### Functions / Methods (Part 2) #######
############################################

function Create-Configuration {
    [CmdletBinding()]
    param (
        <#
            Params are simply the parameters. Unlike Python for example, where you define them outside (def config(param1, param2)),
            in PowerShell you define them within.
        #>
        ## Mandatory: you have to choose a value when writing the cmdlet, or you will be prompted in the terminal.
        ## By default, Functions don't accept pipeline values. In order for it to work, you need to allow them on the specific Param.
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]$Name,
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$Version="1.0.0",
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateSet("Linux", "Windows")]
        [string]$OperatingSystem="Windows"
    )
    begin {
        Write-Verbose "Begin Block"
        $CounterPassed=0
        $CounterFailed=0
    }
    process {
        try {
            Write-Verbose "Creating Configuration for $Name with version $Version"
            New-Item -Path $Path -Name "$($Name).cfg" -ItemType File -ErrorAction Stop
            $Version | Out-File -FilePath "$Path\$($Name).cfg" -Force
            $OperatingSystem | Out-File -FilePath "$Path\$($Name).cfg" -Append -Force
            Write-Verbose "Created config for $Name"
            $CounterPassed++
        }
        catch {
            Write-Output $_.Exception.Message
            Write-Verbose "Failed to create config for $Name"
            $CounterFailed++
        }
        Write-Debug "Configuration created: $CounterPassed"
        Write-Debug "Configuration failed: $CounterFailed"
    }
    end {
        Write-Verbose "End block."
        Write-Output "Configuration created: $CounterPassed , Configuration failed: $CounterFailed"
    }
}
$ConfigPath = "C:\Users\azureuser\Developer\Powershell\Methods\configs"
# $Names=@("TestConfig1", "TestConfig2", "TestConfig3", "TestConfig4")
# $Names | Create-Configuration -Path $ConfigPath -Verbose -Debug

# $IISServer = New-Object -TypeName PSCustomObject
# Add-Member -InputObject $IISServer -MemberType NoteProperty -Name "Name" -Value "IISServer2022"
# Add-Member -InputObject $IISServer -MemberType NoteProperty -Name "Version" -Value "1.0.3"
# Add-Member -InputObject $IISServer -MemberType NoteProperty -Name "OperatingSystem" -Value "Windows"

# $IISServer | Create-Configuration -Path $ConfigPath

## For Import-Csv, by default the Delimiter is ",", so if you have something else you can specify it, otherwise you don't need to include it.
$Servers = Import-Csv -Path "C:\Users\azureuser\Developer\Powershell\Methods\servers.csv" -Delimiter ","
$Servers | Create-Configuration -Path $ConfigPath -Verbose
