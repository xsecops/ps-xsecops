function Set-OEMInformation {
    <# 
        .SYNOPSIS 
        Add OEM System Information
        
        .DESCRIPTION 
        This function adds an OEM Information to OEM information pages within Windows.
    
        .PARAMETER LogoPath
        Path of the desired OEM Logo (will be copied to Windows\System32 folder(s))

        .PARAMETER LogonUIBgPath
        Path of the desired Logon Screen Background

        .PARAMETER Manufacturer

        .PARAMETER SupportPhone

        .PARAMETER SupportHours

        .PARAMETER SupportURL

        .EXAMPLE 
        Add-OEMInformation -Manufacturer xSecOps -SupportPhone "1+ (555) 555-5555" -SupportHours "8:00 AM to 5:00 PM" -SupportURL "https://support.company.com"
            #>	
        [CmdletBinding()]
        param (
            [Parameter(ValueFromPipelineByPropertyName)]
            [string[]]$LogoPath,
            [Parameter(ValueFromPipelineByPropertyName)]
            [string[]]$Manufacturer,
            [Parameter(ValueFromPipelineByPropertyName)]
            [string[]]$SupportPhone,
            [Parameter(ValueFromPipelineByPropertyName)]
            [string[]]$SupportHours,
            [Parameter(ValueFromPipelineByPropertyName)]
            [string[]]$SupportURL,
            [Parameter(ValueFromPipelineByPropertyName)]
            [string[]]$LogonUIBgPath,
            [Parameter(ValueFromPipelineByPropertyName)]
            [string[]]$SystemWallpaperPath
        )

        $strPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation"
        $strPath2 = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background"
        $strPath3 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
        $strPath4 = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    
        if($LogoPath) {
            try {
                if(-not(Test-Path $LogoPath)) {
                    Throw "Cannot enumerate $LogoPath (file does not exist or is inaccessible)"
                }

                # Create Folders if they don't exist
                if (-not(Test-Path c:\Windows\System32\oobe\info\backgrounds))
                {New-item c:\Windows\System32\oobe\info\backgrounds -ItemType Directory}

                Copy-Item $LogoPath "$env:SystemRoot\system32"
                Copy-Item $LogoPath "$env:SystemDrive\ProgramData\Microsoft\User Account Pictures"
                Copy-Item $LogoPath "$env:SystemRoot\system32\oobe\info\"
                Copy-Item $LogoPath "$env:SystemRoot\system32\oobe\info\backgrounds\"
                Copy-Item $LogoPath "$env:SystemRoot\Web\Screen\OEM.bmp"
                Copy-Item $LogoPath "$env:SystemRoot\Web\Wallpaper\Windows\OEM.bmp"

                Set-ItemProperty -Path $strPath -Name Logo -Value "C:\Windows\System32\OEM.bmp"
                

                New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies -Name System -Force
                Set-ItemProperty -Path $strPath4 -Name Wallpaper -value "C:\Windows\Web\Wallpaper\Windows\OEM.bmp"
                Set-ItemProperty -Path $strPath4 -Name WallpaperStyle -value "2"
        } catch {
                Write-Log "ERR" "Failed to set OEM Logo. Skipping this step."
        }
        }

        if($LogonUIBgPath) {
            try {
                if(-not(Test-Path $LogonUIBgPath)) {
                    Throw "Cannot enumerate $LogonUIBgPath (file does not exist or is inaccessible)"
                }
                Copy-Item $LogonUIBgPath "$env:SystemRoot\Web\Screen\OEM.jpg"

                Set-ItemProperty -Path $strPath2 -Name OEMBackground -value 1

                New-Item -Path HKLM:\Software\Policies\Microsoft\Windows -Name Personalization –Force
                Set-ItemProperty -Path $strPath3 -Name LockScreenImage -value "C:\Windows\Web\Screen\OEM.jpg"
                
        } catch {
                Write-Log "ERR" "Failed to set LogonUIBgPath. Skipping this step."
        }
        }

        if($SystemWallpaperPath) {
            try {
                if(-not(Test-Path $SystemWallpaperPath)) {
                    Throw "Cannot enumerate $SystemWallpaperPath (file does not exist or is inaccessible)"
                }
                Copy-Item $SystemWallpaperPath "$env:SystemRoot\Web\Wallpaper\Windows\OEM.jpg"
                New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies -Name System -Force
                Set-ItemProperty -Path $strPath4 -Name Wallpaper -value "C:\Windows\Web\Wallpaper\Windows\OEM.jpg"
                Set-ItemProperty -Path $strPath4 -Name WallpaperStyle -value "2"
        } catch {
                #Write-Log "ERR" "Failed to set System Wallpaper. Skipping this step."
        }
        }

        if($Manufacturer) {
            Write-Log "INFO" "OEM Manufacturer: $Manufacturer"
            Set-ItemProperty -Path $strPath -Name Manufacturer -Value "$Manufacturer"
        }

        if($SupportPhone) {
            Write-Log "INFO" "OEM Support Phone: $SupportPhone"
            Set-ItemProperty -Path $strPath -Name SupportPhone -Value "$SupportPhone"
        }

        if($SupportHours) {
            Write-Log "INFO" "OEM Support Hours: $SupportHours"
            Set-ItemProperty -Path $strPath -Name SupportHours -Value "$SupportHours"
        }

        if($SupportURL) {
            Write-Log "INFO" "OEM Support URL: $SupportURL"
            Set-ItemProperty -Path $strPath -Name SupportURL -Value "$SupportURL"
        }
    }
    
    Export-ModuleMember -Function Set-OEMInformation