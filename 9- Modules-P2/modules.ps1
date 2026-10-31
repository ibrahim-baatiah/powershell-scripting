################################
####### Modules (Part 2) #######
################################

## The Manifest file type is .psd1
New-ModuleManifest -Path "C:\Users\azureuser\Developer\Powershell\9- Modules-P2\Configurations\Configurations.psd1" `
    -Author "Ibrahim" `
    -Description "Test module" `
    -ModuleVersion "1.0.0" `
    -RootModule "Configurations.psm1"


## So, you can either import your modules with their folder path as below:
Import-Module "C:\Users\azureuser\Developer\Powershell\9- Modules-P2\Configurations" -Force
## Why use -Force? By default, if the module is already imported it won't do anything. So if you made or added any changes to your module, -Force will re-import the module to include them.

## Or the other option is to move your folder to one of the locations where PowerShell already checks for modules. How to know these locations? Use the below:
# $($env:PSModulePath).Split(";")

Get-Command -Module Configurations

Get-Help Get-Configuration -Full
