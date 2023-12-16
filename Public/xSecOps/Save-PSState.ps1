Function Save-PSState {
    <# 
        .SYNOPSIS 
        Save the current PowerShell session location
        
        .DESCRIPTION 
        Save the current PowerShell session location and optionally restore the current pwd location next time PowerShell starts up.
    
        .PARAMETER AutoRestore

        .EXAMPLE 
        Save-PSState

        .EXAMPLE
        Save-PSState -AutoRestore
            #>	
        [CmdletBinding()]
        param (
            [Parameter(ValueFromPipelineByPropertyName)]
            [switchParameter]$AutoRestore
        )

        Write-Log "INFO" "Saving PowerShell Session State"

        $currentPath = (Get-Location).Path

}

Export-ModuleMember -Function Save-PSState