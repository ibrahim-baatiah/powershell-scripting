###################################
####### Functions / Methods #######
###################################

<#
    For functions in PowerShell to work with the pipeline as expected, ensure the Function has:
    Block 1: Begin
    Block 2: Process
    Block 3: End
#>
function Create-Configuration {
    [CmdletBinding()]
    param (
        <#
            Params are simply the parameters. Unlike Python for example, where you define them outside (def config(param1, param2)),
            in PowerShell you define them within.
        #>
        ## Mandatory: you have to choose a value when writing the cmdlet, or you will be prompted in the terminal.
        ## By default, Functions don't accept pipeline values. In order for it to work, you need to allow them on the specific Param.
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$Name,
        [Parameter()]
        [string]$Version="1.0.0",
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter()]
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
            $CounterPassed++
        }
        catch {
            Write-Output $_.Exception.Message
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

# Create-Configuration -Name TestConfig3 -Version "1.2.1" -Path $ConfigPath -OperatingSystem "Linux"


# New-Item -Path $ConfigPath -Name "TestConfig.cfg" -ItemType File


$Names=@("TestConfig1", "TestConfig2", "TestConfig3", "TestConfig4")

<#
    Debug & Verbose
    Verbose is just really telling the user what's going on.
    Debug, same thing... but for a different purpose.
    Verbose is to tell the user the steps that were taken, Debug is to inform on errors.
#>
$Names | Create-Configuration -Path $ConfigPath -Verbose -Debug
