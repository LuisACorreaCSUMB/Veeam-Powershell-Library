#Create local administrator user on a particular machine
#Do Not utilize on a Domain Controller
$Username = Read-Host 'Please enter in the username'
$Password = Read-Host 'Please enter the requested password' -AsSecureString
$FullName = Read-Host 'Please enter the Full name for the service account'
New-LocalUser $Username -Password $Password -FullName $FullName -Description "Service Account for Veeam Backups"
Add-LocalGroupMember -Group "Administrators" -Member $Username
Write-Output 'Script ran Successfully.'
cmd /c pause