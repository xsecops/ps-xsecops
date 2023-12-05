<#	
	.NOTES
	===========================================================================
	 Created on:   	12/04/2023 8:01 PM
	 Created by:   	xSecOps
	 Filename:     	ConvertFrom-Base64
	===========================================================================
	.DESCRIPTION
		Decode from Base64
#>

Function ConvertFrom-Base64
{
    <#
        .SYNOPSIS
        Decode Base64 encoded string
        .DESCRIPTION
        Helper function to manage base64 encoded strings
        .EXAMPLE
        "Foo" | ConvertFrom-Base64
        >> "Zm9v"
    #>
    [cmdletbinding()]
    param (
        [Parameter(ValueFromRemainingArguments)]
        [string]$Input,
        [Parameter(ValueFromPipeline)]
        [string]$PipelineInput
    )
    begin
    {
        if ($Input) { return $Input | ConvertFrom-Base64 }
    }
    process
    {
        [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($PipelineInput))
    }
}

Export-ModuleMember -Function ConvertFrom-Base64