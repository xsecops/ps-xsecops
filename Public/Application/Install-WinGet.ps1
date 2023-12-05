#https://github.com/microsoft/winget-cli
function Install-WinGet {

    $url = 'https://github.com/microsoft/winget-cli/releases/latest'
    $request = [System.Net.WebRequest]::Create($url)
    $response = $request.GetResponse()
    $realTagUrl = $response.ResponseUri.OriginalString
    $version = $realTagUrl.split('/')[-1].Trim('v')
    $fileName = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    $realDownloadUrl = $realTagUrl.Replace('tag', 'download') + '/' + $fileName

    Get-File $realDownloadUrl "$script:OutputDir\Downloads\winget.msixbundle"

    Add-AppxPackage -Path "$script:OutputDir\Downloads\winget.msixbundle"
}

Export-ModuleMember -Function Install-WinGet