# Enable Windows SmartScreen Filter
Write-Host "Enabling Windows SmartScreen Filter"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -Type String -Value "RequireAdmin" -ErrorAction SilentlyContinue