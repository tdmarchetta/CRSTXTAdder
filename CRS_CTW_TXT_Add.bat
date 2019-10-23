set zone=%1
set id=%2
set value=%3

powershell.exe -file "C:\crsadmin\TXTAdder\CRS_CTW_TXT_Add.ps1" -zone %zone% -id %id% -value %value%