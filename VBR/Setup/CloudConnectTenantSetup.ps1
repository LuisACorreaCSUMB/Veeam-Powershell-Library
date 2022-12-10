#Cloud Connect Tenant connection to Partners/MSPs
$Name = Read-Host 'Please enter in the Tenant Name.  \/:*?\"<>|=; as well as Unicode characters are not allowed'
$Password = Read-Host "Enter in the tenant password"
$Description = Read-Host "Please enter in a description for the tenant"
$TenantResources = ''
Add-VBRCloudTenant -name $name -Password $Password -Description $Description -Resources $TenantResources