# Lab 2 - Registry Permissions
slmgr -rearm







































































































# Insert run script in to IEUser's Startup Directory
$acl = Get-Acl HKLM:\SYSTEM\CurrentControlSet\Services\OpenSSHd
$rule = New-Object System.Security.AccessControl.RegistryAccessRule ("privesc","FullControl","Allow")
$acl.SetAccessRule($rule)
$acl |Set-Acl -Path HKLM:\SYSTEM\CurrentControlSet\Services\OpenSSHd

$Acl = Get-Acl "C:\users\sshd_server\Desktop\"
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("IEuser", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$Acl.SetAccessRule($Ar)
Set-Acl C:\users\sshd_server\Desktop $Acl
echo "net user \\localhost\c$ /user:IEUser /password:Passw0rd! x:" >> C:\users\sshd_server\Desktop\script.bat
