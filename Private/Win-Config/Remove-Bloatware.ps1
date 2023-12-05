# Remove Default bloatware
Write-Host "Removing default bloatware"
Get-AppxPackage -AllUsers |
    Where-Object {$_.name -notlike "*Microsoft.FreshPaint*"} |
    Where-Object {$_.Name -notlike "*Microsoft.WindowsCalculator*"} |
    Where-Object {$_.Name -notlike "*Microsoft.WindowsStore*"} |
    Where-Object {$_.Name -notlike "*Microsoft.Windows.Photos*"} |
    Remove-AppxPackage -ErrorAction SilentlyContinue

Get-AppxProvisionedPackage -Online |
    Where-Object {$_.name -notlike "*Microsoft.FreshPaint*"} |
    Where-Object {$_.Name -notlike "*Microsoft.WindowsCalculator*"} |
    Where-Object {$_.Name -notlike "*Microsoft.WindowsStore*"} |
    Where-Object {$_.Name -notlike "*Microsoft.Windows.Photos*"} |
    Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue