# Tab 3 - Unquoted Service Path
# Here be spoliers, if you are really really stuck then you can have a look here. Otherwise, keep trying
slmgr -rearm



































































































































































































































































































































































# Mix up a little and make a very specific directory writable

# Set the appropriate unquoated service here, changing the officeClickToRun to Unquoated within Registry
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\ClickToRunSVC\"
$name = "ImagePath"
$value = 'C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeClickToRun.exe'
New-ItemProperty -path $regPath -name $name -Value $value -Force

# Now we need to change the permissions of a very specific folder
Takeown /F "C:\Program Files\Common Files\Microsoft Shared"
icacls "C:\Program Files\Common Files" /grant privesc:F /t /c
