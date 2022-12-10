#Veeam 365 Job Creation for the entire Organization
$OrganizationName = Read-Host "Please enter the organization name"
$Org = Get-VBOOrganization -Name $OrganizationName
$JobName = Read-Host "Please enter in the Job Name"
$RepositoryName = Read-Host "Please enter in the Repository Name"
$Repo = Get-VBORepository -Name $RepositoryName
Add-VBOJob -Organization $Org -Name $JobName -Repository $Repo -EntireOrganization
Write-Output 'Script ran Successfully.'
cmd /c pause