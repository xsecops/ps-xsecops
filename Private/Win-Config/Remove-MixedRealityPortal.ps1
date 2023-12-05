# Allowing uninstall of mixed reality portal
Write-Host "Allow uninstall of mixed reality portal"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Holographic" -Name "FirstRunSucceeded" -Type DWord -Value 0 -ErrorAction SilentlyContinue