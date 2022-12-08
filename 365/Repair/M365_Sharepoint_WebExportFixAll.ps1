$Domain = Read-Host -Prompt 'Input the domain'
$Site = 'Https://' + $Domain + '-admin.sharepoint.com'
Connect-SPOService -Url $Site
$sites = Get-SPOSite | select URL, DenyAddAndCustomizePages
foreach ($site in $sites)
    {
        
        Write-Output $site.DenyAddAndCustomizePages
        if ($site.DenyAddAndCustomizePages -eq 'Enabled')
        {
            Set-SPOSite $site | -DenyAddAndCustomizePages
            Write-Output "Enabled Exports for $site"
        }

        
    }
Write-Output 'Script ran Successfully.'
cmd /c pause