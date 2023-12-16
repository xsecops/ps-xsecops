Function Backup-PSProfile {
    <# 
        .SYNOPSIS 
        Backup specified PowerShell profile(s)
        
        .DESCRIPTION 
        Create backups of specified PowerShell profile(s)
    
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
            [switchParameter]$Reset,
            [Parameter(ValueFromPipelineByPropertyName)]
            [string]$PSProfile = "CUAH"
        )

        if($PSProfile -eq "CUAH") {

            if(Test-Path "$Home\Documents\Profile.ps1") {
                Write-Log "INFO" "Backing up current PowerShell Profile"

            }

            $cuah = (Get-Content .\CUAH_profile.ps1 -Raw)


        }





}

Export-ModuleMember -Function Initialize-PSProfile