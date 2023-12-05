Function Get-Uptime {
    <#
	.SYNOPSIS
    Prints the uptime of the specified machine.
    
	.DESCRIPTION
    Prints the uptime of the specified machine. According to the last boot time of the OS.
    
	.EXAMPLE
    Get-Uptime 
    #>
    
    param (
    )

    PROCESS {
            [string]$BootTimeString=(Get-WmiObject win32_operatingsystem).LastBootUpTime -replace '\..*',''
            $BootTimeDT=[datetime]::ParseExact($BootTimeString,'yyyyMMddHHmmss',$null)

            $Time = (Get-Date) - $BootTimeDT

            New-Object PSObject -Property @{
                ComputerName = $env:COMPUTERNAME.ToUpper()
                Uptime       = '{0:00}:{1:00}:{2:00}:{3:00}' -f $Time.Days, $Time.Hours, $Time.Minutes, $Time.Seconds
            } | Select-Object -property * -excludeProperty PSComputerName, RunspaceId
}
}

Export-ModuleMember -Function Get-Uptime