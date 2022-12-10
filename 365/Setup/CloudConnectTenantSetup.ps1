#Cloud Connect Tenant connection to Partners/MSPs
$Name = Read-Host 'Please enter in the Tenant Name.  \/:*?\"<>|=; as well as Unicode characters are not allowed'
$Password = Read-Host "Enter in the tenant password"
$Description = Read-Host "Please enter in a description for the tenant"
#Need to add setup for Scaleout Repositories
$RepositoryName = Read-Host "Please enter in the Repository Name"
$Repository = Get-VBRBackupRepository -Name $RepositoryName
$FriendlyName = Read-Host "Please enter in the Friendly Name"
$Quota = Read-Host "Please Enter in the quota of resources in GB. 1-2097151"
$TenantResources = New-VBRCloudTenantResource -Repository $Repository -RepositoryFriendlyName $FriendlyName -Quota 
Add-VBRCloudTenant -name $name -Password $Password -Description $Description -Resources $TenantResources