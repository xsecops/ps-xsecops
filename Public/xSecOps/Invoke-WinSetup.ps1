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

        & winget install -e --id ShareX.ShareX

        & winget install -e --id Devolutions.RemoteDesktopManager

        & winget install -e --id VMware.HorizonClient

        & winget install -e --id VMware.WorkstationPro

        & winget install -e --id Microsoft.OneDrive
        & winget install -e --id Microsoft.OneDrive.Enterprise

        & winget install -e --id Microsoft.PowerBI

        & winget install -e --id Microsoft.Edge

        & winget install -e --id Microsoft.Office

        & winget install -e --id Microsoft.Teams

        & winget install -e --id Microsoft.DotNet.SDK.7

        & winget install -e --id Microsoft.VisioViewer

        & winget install -e --id Microsoft.VisualStudioCode

        & winget install -e --id Microsoft.Git

        & winget install -e --id Microsoft.Sqlcmd

        & winget install -e --id Microsoft.PowerShell

        & winget install -e --id Microsoft.Sysinternals.ProcessMonitor

        & winget install -e --id Microsoft.Sysinternals.ProcessExplorer

        & winget install -e --id Microsoft.NuGet

        & winget install -e --id Microsoft.WindowsTerminal

        & winget install -e --id Microsoft.VisualStudio.2022.Professional

        & winget install -e --id Amazon.SessionManagerPlugin

        & winget install -e --id Amazon.AWSCLI

        & winget install -e --id Amazon.SAM-CLI

        & winget install -e --id Spotify.Spotify

        & winget install -e --id youtube-dl.youtube-dl

        & winget install -e --id WinSCP.WinSCP

        & winget install -e --id Google.Chrome

        & winget install -e --id Mozilla.Firefox

        & winget install -e --id Bitwarden.Bitwarden

        & winget install -e --id OpenJS.NodeJS

        & winget install -e --id Microsoft.PowerToys

        #& ".$PSScriptRoot\Private\Win-Config\.ps1"
    }
}

Export-ModuleMember -Function Invoke-WinSetup
