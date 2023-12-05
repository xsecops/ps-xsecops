function Get-DCLocalTime() {
[CmdletBinding(DefaultParameterSetName = "Default")]
Param (
	[Parameter(
			   Mandatory = $false,
			   ValueFromPipelineByPropertyName = $true,
			   ParameterSetName = "Default",
			   HelpMessage = "Help for ScriptParamter1."
			   )]
	[ValidateNotNullOrEmpty()]
	[string]$Domain = 'example.com'
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