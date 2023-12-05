<#	
	.NOTES
	===========================================================================
	 Created on:   	12/04/2023
	 Created by:   	xSecOps
	 Filename:     	ConvertTo-Base64
	===========================================================================
	.DESCRIPTION
		Convert text to Base64
#>
Function ConvertTo-Base64
{
    <#
        .SYNOPSIS
        Encode strings to Base64 format
 
        .DESCRIPTION
        Helper function to manage base64 encoded strings
    #>
    param (
        [Parameter(ValueFromRemainingArguments)]
        [String]$Input,
        [Parameter(ValueFromPipeline)]
        [String]$PipelineInput
    )
    begin
    {
        if ($Input) { return $Input | ConvertTo-Base64 }
    }
    process
    {
        $b = [System.Text.Encoding]::Unicode.GetBytes($PipelineInput)
        return [System.Convert]::ToBase64String($b)
    }
}

Export-ModuleMember -Function ConvertTo-Base64
