#Async Job for when something gets stuck. 
#Split off what is getting stuck into it's own job then run this script
$job = Read-Host -Prompt 'Input the job name'
Get-VBOJob -name $job | start-vbojob -runasync
Write-Output 'Script ran Successfully.'
cmd /c pause