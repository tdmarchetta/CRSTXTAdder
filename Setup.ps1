# PowerShell To Setting up Scripts to talk to Certify The Web & Dynu.
# Version 1.0.4
# Author: Taylor D. Marchetta

# Variables
$currentlocation = Get-Location
$crsadminTXT = "C:\crsadmin\TXTAdder\"

# Check for 'C:\crsadmin' folder.
# '.trim' will remove leading and trailing spaces and leading and trailing line breaks
if (!(test-path $crsadminTXT.trim())) {

    # Makes new folder for crsadmin and/or TXTAdder: C:\crsadmin\TXTAdder
    New-Item -Path "$crsadminTXT" -ItemType Directory
}

# Copy file(s) from the location where "Setup.ps1" is at.
Copy-Item -Path "$currentlocation\CRS_*.*" -Destination '$crsadminTXT' -Recurse

# Gets APIKey | Add-Content -Path 
$getAPIKey = Read-Host -Prompt 'Dynu API Key, Please'
$getAPIKey | Add-Content -Path "$crsadminTXT\DynuAPIKey.txt"

# These PowerShell scripts are not signed...
Set-ExecutionPolicy Bypass

# Unblock all files in TXTAdder
Get-ChildItem '$crsadminTXT' | Unblock-File