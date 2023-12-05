# Disable Windows Lockscreen Spotlight
Write-host "Disabling Windows Lockscreen Spotlight"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "RotatingLockScreenEnabled" -Type DWord -Value 0 -ErrorAction SilentlyContinue

# Disable Lock Screen (Anniversary Update workaround)
Write-Host "Disabling Lock Screen (Anniversary Update workaround)"
If ([System.Environment]::OSVersion.Build -gt 14392) {
       $service = New-Object -com Schedule.Service
       $service.Connect()
       $task = $service.NewTask(0)
       $task.Settings.DisallowStartIfOnBatteries = $False
       $trigger = $task.Triggers.Create(9)
       $trigger = $task.Triggers.Create(11)
       $trigger.StateChange = 8
       $action = $task.Actions.Create(0)
       $action.Path = "reg.exe"
       $action.Arguments = "add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\SessionData /t REG_DWORD /v AllowLockScreen /d 0 /f"
       $service.GetFolder("\").RegisterTaskDevinition("Disable LockScreen", $task, 6, "NT AUTHORITY\SYSTEM", $null, 4) | Out-Null
}

# Don't show ads / nonsense on the lockscreen
Write-Log "INFO" "Disabling ads and unnecssary widgets on the lockscreen"
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'ContentDeliveryAllowed' -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenEnabled' -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'RotatingLockScreenOverlayEnabled' -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338387Enabled' -Value 0