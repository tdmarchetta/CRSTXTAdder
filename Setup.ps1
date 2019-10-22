crsadmin# PowerShell To Setting up Scripts to talk to Certify The Web.
# Author: Taylor D. Marchetta

$currentlocation = Get-Location
$TXTAdderlocation = 'C:\crsadmin\TXTAdder\'
New-Item -Path "C:\crsadmin\" -Name "TXTAdder" -ItemType "directory"

# Copy file(s) from the location where "Setup.ps1" is at.
Copy-Item -Path "$currentlocation\CTW_TXT_Add.bat" -Destination $TXTAdderlocation
Copy-Item -Path "$currentlocation\CTW_TXT_Add.ps1" -Destination $TXTAdderlocation
Copy-Item -Path "$currentlocation\CTW_TXT_Delete.bat" -Destination $TXTAdderlocation
Copy-Item -Path "$currentlocation\CTW_TXT_Delete.ps1" -Destination $TXTAdderlocation
Copy-Item -Path "$currentlocation\RDGateway_Update.ps1" -Destination $TXTAdderlocation

# $getAPIKey | Add-Content -Path 
$getAPIKey = Read-Host -Prompt 'Dynu API Key, Please'
$getAPIKey | Add-Content -Path "C:\crsadmin\TXTAdder\DynuAPIKey.txt"

# These PowerShell scripts are not signed...
Set-ExecutionPolicy Bypass

# Unblock all files in crsadmin
Get-ChildItem C:\crsadmin\TXTAdder\ | Unblock-File