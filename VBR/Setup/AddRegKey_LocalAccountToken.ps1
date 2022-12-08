#Registry key is used so Veeam can access the machines
$RegistryPath = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System'
$Name = 'LocalAccountTokenFilterPolicy'
$Value = '1'
if (-NOT (Test-Path $RegistryPath))
{
    New-Item -Path $RegistryPath -Force | Out-Null
}

New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force

Write-Host "Registry Key Created for $C Share to be available to local administrators"
cmd /c pause