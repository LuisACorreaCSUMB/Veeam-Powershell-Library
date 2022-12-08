#Script intended to start a new full for any issues with corruption
#If happening during restore, please contact support
$JobName = Read-Host "Please enter the Job Name"
Start-VBRJob -Job $JobName -FullBackup
Write-Output 'Script ran Successfully.'
cmd /c pause