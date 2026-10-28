########################
####### Pipeline #######
########################

## The idea of a pipeline, is that it takes the output from one command
## and pass it onto another command as an input.
$serviceName="Spooler"

Get-Service -Name $serviceName

Stop-Service -Name $serviceName

Get-Help Stop-Service -Full ## You see in Parameters that some arguments accetps pipeline while some don't

(Get-Service -Name $serviceName).GetType() # ServiceContoller
#   -Name <string[]>
        
#         Required?                    true
#         Position?                    0
#         Accept pipeline input?       true (ByValue, ByPropertyName)
#         Parameter set name           Default
#         Aliases                      ServiceName
#         Dynamic?                     false
#         Accept wildcard characters?  false

## We can pass the name to Stop-Service because Stop-Service accepts pipeline input ByValue, BypropertyName too.
Get-Service -Name $serviceName | Stop-Service
## Same thing applies for Get-Service, they have similar rules
$serviceName | Get-Service | Stop-Service

$services=New-Object -TypeName System.Collections.ArrayList
$services.AddRange(@('spooler', 'w32time'))

$services | Get-Service 

$services | Get-Service  | Start-Service

$services | Get-Service | foreach {
    Write-Output "Service: $($_.displayname) is currently $($_.status)"
}