# Stop and disable Home Group services
Write-Host "Disabling Home Group services"
Stop-Service "HomeGroupListener" -ErrorAction SilentlyContinue
Set-Service "HomeGroupListener" -StartupType Disabled -ErrorAction SilentlyContinue
Stop-Service "HomeGroupProvider" -ErrorAction SilentlyContinue
Set-Service "HomeGroupProvider" -StartupType Disabled -ErrorAction SilentlyContinue