[CmdletBinding()]
param(

    [bool]$DotSourceModule = $false

)

Function Set-OutputDir ([string] $name) {
    $script:OutputDir = $name
}

Set-OutputDir "C:\Program Files\xSecOps"

if(-not(Test-Path $OutputDir)) {
    New-Item $OutputDir -ItemType Directory
    New-Item "$OutputDir\Downloads" -ItemType Directory
    New-Item "$OutputDir\bin" -ItemType Directory
}

if(-not(Test-Path "$OutputDir\Downloads")) {
    New-Item "$OutputDir\Downloads" -ItemType Directory
}

if(-not(Test-Path "$OutputDir\bin")) {
    New-Item "$OutputDir\bin" -ItemType Directory
}

Write-Host -ForegroundColor DarkGreen "ps-xSecOps will output logs and artifacts to: $OutputDir"

#Get function files

Get-ChildItem $PSScriptRoot\ -Recurse -Include "*.ps1" | Where-Object { ($_.FullName -NotMatch "Private\\|0-ToDo") } | ForEach-Object {
    if ($DotSourceModule) {
        . $_.FullName
    } else {
        $ExecutionContext.InvokeCommand.InvokeScript(
            $false,
            (
                [scriptblock]::Create(
                    [io.file]::ReadAllText(
                        $_.FullName,
                        [Text.Encoding]::UTF8
                    )
                )
            ),
            $null,
            $null
        )
    }
}
