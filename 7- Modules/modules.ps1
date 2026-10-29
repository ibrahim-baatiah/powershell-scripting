$($env:PSModulePath).Split(";") ## This command retrieves the current PowerShell module paths by accessing the `PSModulePath` environment variable and splitting 
                                ## it into an array using the semicolon (`;`) as the delimiter. Each element in the resulting array represents a directory where PowerShell 
                                ## modules can be found. This is useful for understanding where PowerShell looks for modules when you import them or use cmdlets from them.

Get-Module -ListAvailable ## This command lists all the PowerShell modules that are available on the system. It searches through the directories specified in the `PSModulePath` 
                          ## environment variable and displays information about each module, such as its name, version, and path. This is helpful for discovering what modules 
                          ## you can use in your PowerShell session.

Import-Module -Name ScheduledTasks

Get-Command -Module ScheduledTasks ## This command checks if the `ScheduledTasks` module is available on the system. It lists the module's details, including its name, version, and path, 
                                   ## allowing you to verify that the module can be imported and used in your PowerShell session.


Get-ScheduledTask

Remove-Module ScheduledTasks

Import-Module -Name ScheduledTasks -Force

Find-Module -Name Azure
Find-Module -Name Git

Install-Module -Name Azure