function Install-LatestPS {
$url = 'https://github.com/PowerShell/PowerShell/releases/latest'
$request = [System.Net.WebRequest]::Create($url)
$response = $request.GetResponse()
$realTagUrl = $response.ResponseUri.OriginalString
$version = $realTagUrl.split('/')[-1].Trim('v')
$fileName = "PowerShell-$version-win-x64.msi"
$realDownloadUrl = $realTagUrl.Replace('tag', 'download') + '/' + $fileName

Get-File $realDownloadUrl "$OutputDir\Downloads\ps-latest.msi"

Start-Process "msiexec.exe" -ArgumentList "/Package $OutputDir\Downloads\ps-latest.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1 DISABLE_TELEMETRY=1"

Write-Log "INFO" "PowerShell 7 downloaded and installed from: $realDownloadUrl"

}

Export-ModuleMember -Function Install-LatestPS