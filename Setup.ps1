# PowerShell To Setting up Scripts to talk to Certify The Web.
# Version 1.0.3
# Author: Taylor D. Marchetta

# Variables

# Get's the location of the executed PowerShell script and turns it into a valuable
$currentlocation = Get-Location
$crsadmin = "C:\crsadmin\"
$crsadminTXT = "C:\crsadmin\TXTAdder\"

# Check for 'C:\crsadmin' folder.
if (!(Test-Path '$crsadmin')) {

    # Makes new folder "TXTAdder"
    New-Item -Path "C:\" -Name "crsadmin" -ItemType Directory
}

# Makes new folder "TXTAdder"
New-Item -Path "C:\crsadmin" -Name "TXTAdder" -ItemType Directory

# Copy file(s) from the location where "Setup.ps1" is at.
Copy-Item -Path "$currentlocation\CRS_*.*" -Destination '$crsadminTXT' -Recurse

# Gets APIKey | Add-Content -Path 
$getAPIKey = Read-Host -Prompt 'Dynu API Key, Please'
$getAPIKey | Add-Content -Path "$crsadminTXT\DynuAPIKey.txt"

# These PowerShell scripts are not signed...
Set-ExecutionPolicy Bypass

# Unblock all files in TXTAdder
Get-ChildItem '$crsadminTXT' | Unblock-File

# “The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it” - Steve Jobs