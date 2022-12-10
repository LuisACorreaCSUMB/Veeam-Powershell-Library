#Script to add Repository that doesn't require Credentials
$Path = Read-Host "Please enter the file path of the repository"
$ServerName = Read-Host "Please enter the name of the server where the repository will be located"
$Name = Read-Host "Please enter in the name of the new repository"
$Description = Read-Host "Please enter in the Description"
$Server = Get-VBRServer -Name $ServerName
Add-VBRBackupRepository -Folder $Path -Type WinLocal -Name $Name -Description $Description -Server $Server
cmd /c pause