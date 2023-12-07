#https://github.com/microsoft/winget-cli
function Install-WinGet {

    Get-File "https://aka.ms/getwinget" "$script:OutputDir\Downloads\winget.msixbundle"

    Add-AppxPackage -Path "$script:OutputDir\Downloads\winget.msixbundle"
}

Export-ModuleMember -Function Install-WinGet