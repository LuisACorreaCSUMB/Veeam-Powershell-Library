#Veeam 365 Job Creation for the entire Organization
$Organization = Read-Host "Please enter the organization name"
$JobName = Read-Host "Please enter in the Job Name"
$Repository = Read-Host "Please enter in the Repository Name"
Add-VBOJob -Organization $Organization -Name $JobName -Repository $Repository -EntireOrganization
Write-Output 'Script ran Successfully.'
cmd /c pause