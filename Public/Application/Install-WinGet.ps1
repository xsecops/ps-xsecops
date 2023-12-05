#https://github.com/microsoft/winget-cli
function Install-WinGet {

    $url = 'https://github.com/microsoft/winget-cli/releases/latest'
    $request = [System.Net.WebRequest]::Create($url)
    $response = $request.GetResponse()
    $realTagUrl = $response.ResponseUri.OriginalString
    $version = $realTagUrl.split('/')[-1].Trim('v')
    $fileName = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    $realDownloadUrl = $realTagUrl.Replace('tag', 'download') + '/' + $fileName

    Get-File $realDownloadUrl "$OutputDir\Downloads"

    Add-AppxPackage -Path "$OutputDir\Downloads\$fileName"
}

Export-ModuleMember -Function Install-WinGet