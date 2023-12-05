#https://code.visualstudio.com/sha/download?build=stable&os=win32-x64

#winget install -e --id Microsoft.VisualStudioCode

#winget upgrade --id Microsoft.VisualStudioCode

# Get the WinGet installed path
function Install-VSCode {
    [CmdletBinding()]
    [OutputType([string])]
    param (
    )

    if(-not(Test-Path $script:OutputDir)) {
        New-Item $script:OutputDir -ItemType Directory
    }

    Set-Location $script:OutputDir

    Write-Host "Beginning installation of Microsoft Visual Studio Code..."
    if(Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "Using winget package manager to install Microsoft Visual Studio Code..."
        & winget install -e --id Microsoft.VisualStudioCode
    } else {
        Write-Host "Winget package manager was not available, downloading and running silent installation..."
        Write-Host "Downloading Visual Studio Code from: https://code.visualstudio.com/sha/download?build=stable&os=win32-x64"
        Invoke-WebRequest "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64" -UseBasicParsing -OutFile "vscode.exe"
        Write-Host "Downloading File"
        Start-Process .\vscode.exe -ArgumentLIst "/VERYSILENT /MERGETASKS=!runcode"
        Write-Host "Silent install executed, VS Code should be available shortly..."
    }
}

Export-ModuleMember -Function Install-VSCode