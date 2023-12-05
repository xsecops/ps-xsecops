# Disable AutoPlay
Write-Host "Disabling AutoPlay"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoPlayHandlers" -Name "DisableAutoPlay" -Type DWord -Value 1 -ErrorAction SilentlyContinue

# Disable AutoRun for all drives
Write-Host "Disabling AutoRun for all drives"
if (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ErrorAction SilentlyContinue | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDriveTypeAutoRun" -Type DWord -Value 255 -ErrorAction SilentlyContinue
