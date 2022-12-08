#This script is to setup Group Owner scripts.
#It will apply a single email as admin to all group accounts
#Utilize an IT account to prevent unwanted access
Connect-ExchangeOnline
$Admin = Read-Host -Prompt 'Input the default admin account email'
Get-UnifiedGroup -ResultSize Unlimited | ForEach-Object
{
    Add-UnifiedGroupLinks -Identity $_.Name -LinkType Members -Links $Admin
    Add-UnifiedGroupLinks -Identity $_.Name -LinkType Owners -Links $Admin
    Write-Host "Added Owner to Group:"$_.DisplayName
}

Write-Output 'Script ran Successfully.'
cmd /c pause