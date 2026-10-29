function Create-Configuration {
    [CmdletBinding()]
    param ( ## Params is simple the parameters, unlike Python for examlpe where you define them outside (def config(param1, param2)). In PowerShell you define them within.
        [Parameter(Mandatory, ValueFromPipeline)] ## Mandatory, you have to choose a value when writing the cmdlet, or you will be prompted in the terminal.
        [string]$Name, ## By default, Functions don't accepts pipline values, in order for it to work you need to allow them from the specifc Param.
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
        Write-Output "Configuration create: $CounterPassed , Configuration failed: $CounterFailed"
    }
}

$ConfigPath = "C:\Users\azureuser\Developer\Powershell\Methods\configs"

# Create-Configuration -Name TestConfig3 -Version "1.2.1" -Path $ConfigPath -OperatingSystem "Linux"


# New-Item -Path $ConfigPath -Name "TestConfig.cfg" -ItemType File


$Names=@("TestConfig1", "TestConfig2", "TestConfig3", "TestConfig4")

$Names | Create-Configuration -Path $ConfigPath -Verbose -Debug


## Debug & Verbose
## Verbose it just really telling the user what's going on.
## Debug, same thing... but for different porpuse
## Verbose is to tell the user the steps that were taken, debut is to inform on errors. 

## Fucntions in PowerShell with pipline to work as expected, ensure the Function has:
## Block 1: Begin 
## Block 2: Process
## Block 3: End