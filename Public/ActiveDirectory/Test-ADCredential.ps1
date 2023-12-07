	<#
	.SYNOPSIS
		Test username/password combination against Active Directory
	.DESCRIPTION
	 	Test username/password combination against Active Directory
	.PARAMETER Username
		Username to test
    .PARAMETER Password
        Password to test
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

function Test-ADCredential {
    param(
        $username,
        $password)
    
    $null -ne (New-Object DirectoryServices.DirectoryEntry "",$username,$password).psbase.name
}

Export-ModuleMember -Function Test-ADCredential
