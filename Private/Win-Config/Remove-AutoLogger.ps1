# Remove AutoLogger and restrict directory
Write-Host "Removing AutoLogger and restrict directoy"

$autoLoggerDir = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
If (Test-Path "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl") {
    Remove-Item "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl" -ErrorAction SilentlyContinue
}
icacls $autoLoggerDir /deny SYSTEM:`(OI`)`(CI`)F -ErrorAction SilentlyContinue | Out-Null