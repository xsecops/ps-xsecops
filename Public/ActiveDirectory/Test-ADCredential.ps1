function Test-ADCredential {
    param(
        $username,
        $password)
    
    $null -ne (New-Object DirectoryServices.DirectoryEntry "",$username,$password).psbase.name
}

Export-ModuleMember -Function Test-ADCredential
