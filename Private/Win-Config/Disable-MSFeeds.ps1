    ##Removes the Microsoft Feeds from displaying
    $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
    $Name = "EnableFeeds"
    $value = "0"
    
    if (!(Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
        New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
    }
    
    else {
        New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
    }