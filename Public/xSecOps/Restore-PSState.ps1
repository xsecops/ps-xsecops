Function Restore-PSState {
    <# 
        .SYNOPSIS 
        Restore a previous PowerShell session
        
        .DESCRIPTION 
        Restore a previous PowerShell session
    
        .PARAMETER DefaultProfile

        .EXAMPLE 
        Restore-PSState

        .EXAMPLE
        Restore-PSState -AutoRestore
            #>	
        [CmdletBinding()]
        param (
            [Parameter(ValueFromPipelineByPropertyName)]
            [switchParameter]$DefaultProfile
        )
}

Export-ModuleMember -Function Restore-PSState