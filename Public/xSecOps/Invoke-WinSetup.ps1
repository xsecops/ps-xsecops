function Invoke-WinSetup {
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [switch]$Unattended
    )

    Write-Log "MSG" "Beginning Windows Setup & Customization"

    if($Unattended) {
        Write-Log "MSG" "Invoke-WinSetup executed in unattended mode. Using default WinSetup options"
        & ".$PSScriptRoot\Private\Win-Config\Disable-AdvertisingID.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-BingSearch.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-ConsumerFeatures.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-Cortana.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-DiagnosticTracking.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-Feedback.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-Homegroup.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-LocationTracking.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-Suggestions.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-Telemetry.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-WAPPushService.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-WifiSense.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-WindowsGameDVR.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Remove-AutoLogger.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Remove-MixedRealityPortal.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Remove-Bloatware.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Remove-PeopleIcon.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Remove-OneDrive.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Cleanup-Registry.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Cleanup-SchTasks.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-PreinstalledApps.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-OptionalFeatures.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-Autorun.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Disable-SMBv1.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Configure-Lockscreen.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Configure-WinUpdate.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Configure-Explorer.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Enable-WinFirewall.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Enable-SmartScreenFilter.ps1"
        & ".$PSScriptRoot\Private\Win-Config\Configure-PowerPreferences.ps1"
        
        Clear-StartMenu

        #& ".$PSScriptRoot\Private\Win-Config\.ps1"
    }
}

Export-ModuleMember -Function Invoke-WinSetup
