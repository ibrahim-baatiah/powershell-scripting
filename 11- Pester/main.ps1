Invoke-Pester (.\Pester\pestertest.ps1 -ComputerName "100.121.11.94" -Credential Get-Credential)
<#
    If you invoked the test this way it will not show the actuall result. 
    When the test finishs, it tells you how many passed, failed, skipped... etc. Example output:
    ###########################################################################################
    ################ Passed: 0 Failed: 0 Skipped: 0 Pending: 0 Inconclusive: 0 ################
    ###########################################################################################
    To actually make the test reflect on this, save the paramters into a hash-map varialbe and use:
#>

$ScriptParams=@{
    Path="C:\Users\ibrahim\Developer\Poweshell\Pester\pestertest.ps1"
    Params= @{
        ComputerName='100.121.11.94'
        Creds=Get-Credential
    }
}

Invoke-Pester -Script $ScriptParams -OutputFile "C:\Users\ibrahim\Developer\Poweshell\Pester\results.xml" -OutputFormat NUnitXml

<#
    This one now actaully shows the results:
    ###########################################################################################
    ################ Passed: 0 Failed: 1 Skipped: 0 Pending: 0 Inconclusive: 0 ################
    ###########################################################################################
#>