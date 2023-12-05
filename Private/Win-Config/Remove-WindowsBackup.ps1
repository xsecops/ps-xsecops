############################################################################################################
#                                           Windows Backup App                                             #
#                                                                                                          #
############################################################################################################
$version = Get-WMIObject win32_operatingsystem | Select-Object Caption
if ($version.Caption -like "*Windows 10*") {
    write-host "Removing Windows Backup"
    $filepath = "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\WindowsBackup\Assets"
if (Test-Path $filepath) {
Remove-WindowsPackage -Online -PackageName "Microsoft-Windows-UserExperience-Desktop-Package~31bf3856ad364e35~amd64~~10.0.19041.3393"
}
}