<#	
	.NOTES
	===========================================================================
	 Created on:   	12/04/2023
	 Created by:   	xSecOps
	 Filename:     	Write-Log.ps1
	===========================================================================
	.DESCRIPTION
		Write a message to a log file & optionally output it back out to the session via Write-Output
#>
Function Write-Log($LogLevel = "MSG", $Message, $echoBack = $true)
{
	$msg = "$((Get-Date).ToString("MM/dd/yyyy hh:mm:ss tt zzz")) [$($LogLevel)] $Message"

	Write-Output $msg >> $($PSCommonUtils.OutputLog)
	if ($echoBack)
	{
		Write-Output $msg
	}
}

Export-ModuleMember -Function Write-Log