	<#
	.SYNOPSIS
		Loop through all domain controllers for a specified domain and report the current date/time
	.DESCRIPTION
	 	Identify the currently bound Active Directory domain and loop through all available domain controllers and print out the current time. Used to debug time-drift issues with Kerberos tickets across an Active Directory Domain.
	.INPUTS
		None
	.OUTPUTS
		None
	.EXAMPLE
		Get-DCLocalTime
	.NOTES
		Version: 1.0
		Author:	xSecOps
		Last Updated: 12/06/2023 
	#>

function Get-DCLocalTime() {
[CmdletBinding(DefaultParameterSetName = "Default")]
Param (
)
Begin
{
	#Preprocessing that only runs once per function or script call
	
	$getdomain = [System.Directoryservices.Activedirectory.Domain]::GetCurrentDomain()
	
}
Process
{
	#Continually execute on every object that is passed to the function
	$dcs = $getdomain | ForEach-Object { $_.DomainControllers } |
	ForEach-Object {
		$hEntry = [System.Net.Dns]::GetHostByName($_.Name)
		New-Object -TypeName PSObject -Property @{
			Name = $_.Name
			IPAddress = $hEntry.AddressList[0].IPAddressToString
		}
	} | Sort-Object { $_.Name }
	
	Write-Host "-=-=-=-=-=-=-=-=-=-=-"
	
	foreach ($dc in $dcs.Name)
	{
		$dt = (Get-Date)
		Write-Host "============================================================"
		Invoke-Command -ComputerName $dc -ScriptBlock {Write-Host "$args[0] - $env:ComputerName -" (Get-Date)} -ArgumentList $dt -AsJob -JobName $dc
	}
	
}
End
{
	#Cleanup/Only run once per function or script call
	
}
}

Export-ModuleMember -Function Get-DCLocalTime