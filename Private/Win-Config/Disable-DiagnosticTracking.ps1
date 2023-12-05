# Stop and disable Diagnostics Tracking
Write-Host "Disabling Diagnostics Tracking"
Stop-Service "DiagTrack" -ErrorAction SilentlyContinue
Set-Service "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue