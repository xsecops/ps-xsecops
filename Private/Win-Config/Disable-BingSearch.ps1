# Disable Bing Search in Start Menu
Write-Host "Disabling Bing Search in Start Menu"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type Dword -Value 0 -ErrorAction SilentlyContinue 