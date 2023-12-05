# Disable Feedback
Write-Host "Disabling Feedback"
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force -ErrorAction SilentlyContinue | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0 -ErrorAction SilentlyContinue

# Disable Windows Feedback Experience
Write-Host "Disabling Windows Feedback Experience"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Type DWord -Value 0 -ErrorAction SilentlyContinue

# Disable Windows Tips and Feedback
Write-Host "Disabling Windows Tips and feedback"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SoftLandingEnabled" -Type DWord -Value 0 -ErrorAction SilentlyContinue