#Adding VBO Repository for M365
$Name = Read-Host "Please enter the name of the repository you wish to create"
$Path = Read-Host "Please enter in the file path for the local retention location"
$RetentionType = Read-Host "Please enter in the retention type you would prefer: ItemLevel or SnapshotBased"
$RetentionPeriod = Read-Host "Please enter the retention period you want: KeepForever, Year1, Years2, Years3, Years5, Years7, Years10, Years25"
Add-VBORepository -Proxy -Name $Name -Path $Path -RetentionType $RetentionType -VBORetentionPeriod $RetentionPeriod
#Need to add in Object Storage Repository and schedule editing
cmd /c pause