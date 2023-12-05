#https://github.com/microsoft/winget-cli
function Install-WinGet {
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
}

Export-ModuleMember -Function Install-WinGet