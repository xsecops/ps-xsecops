	<#
	.SYNOPSIS
		Translate names from user or group SID.
	.DESCRIPTION
	 	Translates domain/local users and groups. Cannot translate local accounts/groups originating from other machines.
	.PARAMETER SID
		User or group SID.
	.INPUTS
		None
	.OUTPUTS
		None
	.EXAMPLE
		Get-AccountFromSID S-1-5-21-1441175697-5091284812-1237319257-1001

	.NOTES
		Version: 1.0
		Author:	xSecOps
		Last Updated: 12/06/2023 
	#>

Function Get-AccountFromSID {
	[CmdletBinding()]
	param(
    [Parameter(Mandatory=$true,Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true,HelpMessage="Enter SID of a user or group")]
	$SID
	)

	$objSID = New-Object System.Security.Principal.SecurityIdentifier ("$SID") 
	$objUser = $objSID.Translate( [System.Security.Principal.NTAccount]).Value
	return $objUser
}

Export-ModuleMember -Function Get-AccountFromSID