# Removing unnecessary scheduled tasks
Write-Host "Disabling unnecessary scheduled tasks"

Get-ScheduledTask -TaskName XblGameSaveTaskLogon -ErrorAction SilentlyContinue | Disable-ScheduledTask
Get-ScheduledTask -TaskName XblGameSaveTask -ErrorAction SilentlyContinue | Disable-ScheduledTask
Get-ScheduledTask -TaskName Consolidator -ErrorAction SilentlyContinue | Disable-ScheduledTask
Get-ScheduledTask -TaskName UsbCeip -ErrorAction SilentlyContinue | Disable-ScheduledTask
Get-ScheduledTask -TaskName DmClient -ErrorAction SilentlyContinue | Disable-ScheduledTask
Get-ScheduledTask -TaskName DmClientOnScenarioDownload -ErrorAction SilentlyContinue | Disable-ScheduledTask
