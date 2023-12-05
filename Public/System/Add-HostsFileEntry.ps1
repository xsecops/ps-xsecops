#requires -Version 3
<#	
.NOTES
	===========================================================================
	 Created on:   	12/04/2023
	 Created by:   	xSecOps
	 Filename:     	Add-HostsFileEntry.ps1
	===========================================================================
.DESCRIPTION
Add an entry into C:/Windows/system32/drivers/etc/hosts

.SYNOPSIS
Add an entry into C:/Windows/system32/drivers/etc/hosts

.PARAMETER IPEntry
IP Address to redirect to (defaults to 0.0.0.0)

.PARAMETER HostEntry
Domain to add/redirect/block

.EXAMPLE
Add-HostsFileEntry -IPEntry "0.0.0.0" -HostEntry "xyz.com"

#>
Function Add-HostFileEntry {

    # Adds an entry to the HOSTS file if the entry isn't already there
    # IPEntry = IP Address to add to HOSTS file
    # HostEntry = Hostname to add to HOSTS file

    Param (
        [Parameter(Mandatory=$False)]
        [string] $IPEntry = "0.0.0.0",
        
        [Parameter(Mandatory=$True)]
        [string] $HostEntry
    )

    Begin {
    
        # Define the HOSTS file path and get the content into a string so we can check to see if an entry already exists
        $HostsFilePath = $Env:windir + "\system32\drivers\etc\hosts"
        $HostsFile = Get-Content -Path $HostsFilePath
            
    }
    
    Process {
    
        # Create a search pattern using a regular expression with the host entry
        $RegExHostName = [Regex]::Escape($HostEntry)
        $SearchPattern = ".*$IPEntry\s+$RegExHostName.*"
        
        # Search for the host entry in the content of the HOSTS file
        $InFile = ($HostsFile -match $SearchPattern)
        
        # Process if entry is there or not
        If ($InFile) {
        
            # Log that the entry is already present
            $Msg = $HostEntry + "already present in HOSTS file"
        
        } Else {
        
            # Log that the entry is NOT present and then add it
            $Msg = $HostEntry + "not present in HOSTS file...adding it"
            $DateString = Get-Date -Format "yyyyMMdd HH:mm"
            $EntryToAdd = $IPEntry + "     " + $HostEntry + "     # Sinkhole bad domain added on " + $DateString
            Add-Content -Encoding UTF8 -Path $HostsFilePath -Value $EntryToAdd
        }
    
    }
    End{}
}

Export-ModuleMember -Function Add-HostFileEntry