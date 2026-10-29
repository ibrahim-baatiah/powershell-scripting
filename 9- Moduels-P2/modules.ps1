## Manifast file type is .psd1
New-ModuleManifest -Path "C:\Users\azureuser\Developer\Powershell\9- Moduels-P2\Configurations\Configurations.psd1" `
    -Author "Ibrahim" `
    -Description "Test module" `
    -ModuleVersion "1.0.0" `
    -RootModule "Configurations.psm1" 
    

## So, You can either import your modules with its folder path as below:
Import-Module "C:\Users\azureuser\Developer\Powershell\9- Moduels-P2\Configurations" -Force
## Or the other option is to move your folder to one of the envs where PowerShell already Checks for modules, how to know these location? Use the below:
# $($env:PSModulePath).Split(";")
# Why use -Force? By default if the module alread imported it won't do anything. So if you made or added any chagnes to your module, Force will re-import the module to include them.

Get-Command -Module Configurations

Get-Help Get-Confugration -Full

