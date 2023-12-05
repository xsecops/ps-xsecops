# Remove OneDrive
Write-Host "Removing OneDrive"
taskkill /f /im OneDrive.exe
Stop-Process -Name OneDrive -ErrorAction SilentlyContinue
Start-Sleep -s 3
$oneDrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
If (!(Test-Path $oneDrive)) {
    $oneDrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
}
Start-Process $oneDrive "/uninstall" -NoNewWindow -Wait -ErrorAction SilentlyContinue
Start-Sleep -s 3
Stop-Process -Name Explorer -ErrorAction SilentlyContinue
Start-Sleep -s 3
Remove-Item "$env:USERPROFILE\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item "$env:LOCAPAPPDATA\Microsoft\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item "$env:PROGRAMDATA\Microsoft\Microsoft Onedrive" -Force -Recurse -ErrorAction SilentlyContinue
If (Test-Path "$env:SYSTEMDRIVE\OneDriveTemp") {
    Remove-item "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse -ErrorAction SilentlyContinue
}
If (!(Test-Path "HKCR:")) {
    New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT -ErrorAction SilentlyContinue | Out-Null
}
Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue

# Remove OneDrive ads being displayed in Explorer (Creators Update)
Write-Host "Removing OneDrive ads from Explorer (Creators Update)"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ -name ShowSyncProviderNotifications -Value 0 -ErrorAction SilentlyContinue

Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive' -Name 'DisableFileSyncNGSC' -Value 1  2>&1 | out-null