function Test-AdminRights() {
# Ask for elevated permission
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    return $false
} else {
    return $true
}
}

Export-ModuleMember -Function Test-AdminRights