#requires -Version 3
<#	
.NOTES
	===========================================================================
	 Created on:   	12/04/2023
	 Created by:   	xSecOps
	 Filename:     	Generate-JWT.ps1
	===========================================================================
.DESCRIPTION
Generate a signed JWT token.

.SYNOPSIS
Generate a signed JWT token.

.PARAMETER Algorithm
HS256, HS384, HS512

.PARAMETER type

.PARAMETER Audience

.PARAMETER Issuer

.PARAMETER SecretKey

.PARAMETER ValidforSeconds

.EXAMPLE
Generate-JWT

.EXAMPLE
Generate-JWT -Algorithm 'HS256' -type 'JWT' -Issuer 'https://example.com' -SecretKey 'Secret' -ValidforSeconds 3600

#>
function New-JWT (
    [Parameter(Mandatory = $True)]
    [ValidateSet("HS256", "HS384", "HS512")]
    $Algorithm = "HS512",
    $type = $null,
    [Parameter(Mandatory = $True)]
    [string]$Issuer = "https://example.com/",
    [string]$Audience = "https://example.com/",
    [int]$ValidforSeconds = $null,
    [Parameter(Mandatory = $True)]
    $SecretKey = "TestKey"
    ){

    $exp = [int][double]::parse((Get-Date -Date $((Get-Date).addseconds($ValidforSeconds).ToUniversalTime()) -UFormat %s)) # Grab Unix Epoch Timestamp and add desired expiration.

    [hashtable]$header = @{alg = $Algorithm; typ = $type}
    [hashtable]$payload = @{iss = $Issuer; exp = $exp; aud = $Audience}

    $headerjson = $header | ConvertTo-Json -Compress
    $payloadjson = $payload | ConvertTo-Json -Compress
    
    $headerjsonbase64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($headerjson)).Split('=')[0].Replace('+', '-').Replace('/', '_')
    $payloadjsonbase64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($payloadjson)).Split('=')[0].Replace('+', '-').Replace('/', '_')

    $ToBeSigned = $headerjsonbase64 + "." + $payloadjsonbase64

    $SigningAlgorithm = switch ($Algorithm) {
        "HS256" {New-Object System.Security.Cryptography.HMACSHA256}
        "HS384" {New-Object System.Security.Cryptography.HMACSHA384}
        "HS512" {New-Object System.Security.Cryptography.HMACSHA512}
    }

    $SigningAlgorithm.Key = [System.Text.Encoding]::UTF8.GetBytes($SecretKey)
    $Signature = [Convert]::ToBase64String($SigningAlgorithm.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($ToBeSigned))).Split('=')[0].Replace('+', '-').Replace('/', '_')
    
    $token = "$headerjsonbase64.$payloadjsonbase64.$Signature"
    $token
}

Export-ModuleMember -Function New-JWT