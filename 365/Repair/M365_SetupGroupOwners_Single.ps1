#This script is to setup Group Owner scripts.
#It will apply a single email as admin to multiple or a single group account(s)
#Utilize an IT account to prevent unwanted access
Connect-ExchangeOnline
$Admin = Read-Host -Prompt 'Input the default admin account email'
$Target = Read-Host -Prompt 'Enter the group name to add the admin account to, Enter exit to close script'
while ($Target.ToLower() -ne 'exit')
{
    Add-UnifiedGroupLinks -Identity $Target -LinkType Members -Links $Admin
    Add-UnifiedGroupLinks -Identity $Target -LinkType Owners -Links $Admin
    Write-Host "Added Owner to Group: $Target"
    $Target = Read-Host -Prompt 'Enter the group name to add the admin account to, Enter exit to close script'
}

Write-Output 'Script ran Successfully.'
cmd /c pause