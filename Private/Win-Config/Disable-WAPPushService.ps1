# Stop and disable WAP Push Service
Write-Host "Disabling WAP Push Service"
Stop-Service "dmwappushservice" -ErrorAction SilentlyContinue
Set-Service "dmwappushservice" -StartupType Disabled -ErrorAction SilentlyContinue