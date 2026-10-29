function Create-Configuration {
    [CmdletBinding()]
    param ( ## Params is simple the parameters, unlike Python for examlpe where you define them outside (def config(param1, param2)). In PowerShell you define them within.
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)] ## Mandatory, you have to choose a value when writing the cmdlet, or you will be prompted in the terminal.
        [string]$Name, ## By default, Functions don't accepts pipline values, in order for it to work you need to allow them from the specifc Param.
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
        Write-Output "Configuration create: $CounterPassed , Configuration failed: $CounterFailed"
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

## For import CSV, by default the Delimiter is "," so if you have something else you can specify, otherwise you don't need to include it.
$Servers = Import-Csv -Path "C:\Users\azureuser\Developer\Powershell\Methods\servers.csv" -Delimiter ","
$Servers | Create-Configuration -Path $ConfigPath -Verbose