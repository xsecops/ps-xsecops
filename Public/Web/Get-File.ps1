<#	
	.NOTES
	===========================================================================
	 Created on:   	12/04/2023
	 Created by:   	xSecOps
	 Filename:     	Get-File.ps1
	===========================================================================
	.DESCRIPTION
		Download a file from an external source
#>
Function Get-File
{
    <#
        .SYNOPSIS
        Download a file from an external source
    #>
    param (
        [String]$Source,
        [String]$Outfile,
        [Switch]$Force
    )
    Begin
    {
        #Begin (only runs one time per function call)
    }
    Process
    {
        # Process each object passed to the function

        if((Test-Path $Outfile) -or !($Force)) {
            Write-Log "ERR" "The destination file already exists. Use the -Force parameter to overwrite the existing file."
        } else {
            Set-Variable ProgressPreference SilentlyContinue
            Invoke-WebRequest -Uri $Source -OutFile $Outfile
            Set-Variable ProgressPreference Continue
        }
    }
}

Export-ModuleMember -Function Get-File