# Enable Firewall
Write-Host "Enabling Windows Firewall"
Set-NetFirewallProfile -Profile * -Enabled True -ErrorAction SilentlyContinue