﻿<#	
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
        [Boolean]$AllowTLSDowngrade = $False,
        [Boolean]$IgnoreSSL = $False
    )
    Begin
    {
        #Begin (only runs one time per function call)
    }
    Process
    {
        # Process each object passed to the function
        (New-Object System.Net.WebClient).DownloadFile("$Source", "$Outfile")
    }
}

Export-ModuleMember -Function Get-File