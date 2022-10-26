#Variables
$Domain = Read-Host -Prompt 'Input the domain e.g. cmitsacreno or leverageitc'
$Subsite = Read-Host -Prompt 'Input in the sharepoint site e.g. Advocacy'
$Site = 'Https://' + $Domain + '-admin.sharepoint.com'
#Empty Subsite means base site
If ($Subsite -eq "")
{
    $Target = 'Https://'+ $Domain + '.sharepoint.com/'
}
else
{
    $Target = 'Https://'+ $Domain + '.sharepoint.com/sites/' +$Subsite
}
#Total Run Count
[int]$TargetCount = Read-Host -Prompt 'How many Subsites need to be edited?'
[int]$Count = 0

#Connect to Sharepoint Online
try{ 
Connect-SPOService -Url $Site
}
catch [System.InvalidOperationException] {
 Write-Warning -Message "Site is invalid for Sharepoint Connection"
 cmd /c pause
}
#Loop
While($Count -ne $TargetCount)
{
    If ($Count -eq 0)
    {
        $results = Get-SPOSite $Target | Select DenyAddAndCustomizePages
        Write-Output $results.DenyAddAndCustomizePages
        If ($results.DenyAddAndCustomizePages -eq 'Disabled')
            {
                $results.DenyAddAndCustomizePages
                Write-Output 'Subsite is already set to Disabled'
            }
        elseIf ($results.DenyAddAndCustomizePages -eq 'Enabled')
            {
                Write-Output 'Subsite is enabled, Switching to Disabled'
                Set-SPOSite $Target -DenyAddAndCustomizePages 0
                Get-SPOSite $Target | Select DenyAddAndCustomizePages
            }
    }
    else
    {
        $Subsite = Read-Host -Prompt 'Input in the sharepoint site e.g. Advocacy'
        
        #Empty Subsite means base site
        If ($Subsite -eq "")
        {
            $Target = 'Https://'+ $Domain + '.sharepoint.com/'
        }
        else
        {
            $Target = 'Https://'+ $Domain + '.sharepoint.com/sites/' +$Subsite
        }
        $results = Get-SPOSite $Target | Select DenyAddAndCustomizePages
        If ($results.DenyAddAndCustomizePages -eq 'Disabled')
            {
                $results.DenyAddAndCustomizePages
                Write-Output 'Subsite is already set to Disabled'
            }
        elseIf ($results.DenyAddAndCustomizePages -eq 'Enabled')
            {
                Write-Output 'Subsite is enabled, Switching to Disabled'
                Set-SPOSite $Target -DenyAddAndCustomizePages 0
                Get-SPOSite $Target | Select DenyAddAndCustomizePages
            }
    }
    $Count++
}
Write-Output 'Script ran Successfully.'
cmd /c pause
#Look at test case of doing one with no subsite
