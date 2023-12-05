Write-Log "INFO" "Disabling standby while machine is plugged into AC power"
powercfg /Change standby-timeout-ac 0

Write-Log "INFO" "Changing PROCTHROTTLEMAX to 99% on AC and DC power to greatly improve thermal throttling issues (effectively disables Intel TurboBoost)"
powercfg /setacvalueindex SCHEME_BALANCED SUB_PROCESSOR PROCTHROTTLEMAX 99
powercfg /setdcvalueindex SCHEME_BALANCED SUB_PROCESSOR PROCTHROTTLEMAX 99

Write-Log "INFO" "Changing monitor timeout to 5 hours while machine is plugged into AC power"
powercfg /Change monitor-timeout-ac 300

Write-Log "INFO" "Changing monitor timeout to 15 minutes while machine is running on DC power (battery)"
powercfg /Change monitor-timeout-dc 15

#powercfg /batteryreport

#powercfg -setacvalueindex SCHEME_BALANCED SUB_PROCESSOR PROCTHROTTLEMIN 5
#powercfg -setdcvalueindex SCHEME_BALANCED SUB_PROCESSOR PROCTHROTTLEMIN 5

#powercfg -setacvalueindex SCHEME_BALANCED SUB_PROCESSOR PROCTHROTTLEMAX 99
#powercfg -setdcvalueindex SCHEME_BALANCED SUB_PROCESSOR PROCTHROTTLEMAX 99


#Add Maximum Power State
#powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c -ATTRIB_HIDE

#Remove Maximum Power State
#powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c +ATTRIB_HIDE


#Add Minimum Power State
#powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c -ATTRIB_HIDE

#Remove Minimum Power State
#powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c +ATTRIB_HIDE

#HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec
#Attributes -> 2

#HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c
#Attributes -> 2