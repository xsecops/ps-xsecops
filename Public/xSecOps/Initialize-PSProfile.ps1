Function Initialize-PSProfile {
    <# 
        .SYNOPSIS 
        Setup a specified PowerShell Profile
        
        .DESCRIPTION 
        Setup a specified PowerShell Profile
    
        .PARAMETER PSProfile
        Which profile to initialize.
        - CUAH : (DEFAULT) Current User, All Hosts ($Home\[My ]Documents\Profile.ps1)
        - CUCH : Current User, Current Host - Console ($Home\[My ]Documents\WindowsPowerShell\Profile.ps1)
        - AUCH : All Users, Current Host ($PsHome\Microsoft.PowerShell_profile.ps1)
        - AUAH : All Users, All Hosts ($PsHome\Profile.ps1)
        - CUCH_ISE : ISE ONLY - Current User, Current Host ($Home\[My ]Documents\WindowsPowerShell\Microsoft.P owerShellISE_profile.ps1)
        - AUCH_ISE : ISE ONLY - All Users, Current Host ($PsHome\Microsoft.PowerShellISE_profile.ps1)

        .PARAMETER Reset
        Restore the default profile

        .PARAMETER NoBackups
        Skip taking backups of existing profiles
        
        .EXAMPLE 
        Initialize-PSProfile

        .EXAMPLE
        Initialize-PSProfile -Reset

        .EXAMPLE
        Initialize-PSProfile -PSProfile CUCH
            #>	
        [CmdletBinding()]
        param (
            [Parameter(ValueFromPipelineByPropertyName)]
            [switch]$Reset,
            [Parameter(ValueFromPipelineByPropertyName)]
            [string]$PSProfile = "CUAH"
        )

        if($PSProfile -eq "CUAH") {

            if(Test-Path "$Home\Documents\Profile.ps1") {
                #Backup-PSProfile -PSProfile CUAH
            }
            Set-Content -Path "$Home\Documents\Profile.ps1" -Value (Get-Content $PSScriptRoot\Public\xSecOps\CUAH_profile.ps1 -Raw)
        }
}

Export-ModuleMember -Function Initialize-PSProfile