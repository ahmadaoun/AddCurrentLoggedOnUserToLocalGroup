Param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Install", "Uninstall")]
    [String[]]
    $Mode
)

# Get current logged on user
$loggedon = $(Get-WMIObject -class Win32_ComputerSystem | select username).username
# Get the local administrators group name
$LocalAdminGroup = Get-LocalGroup -SID "S-1-5-32-544"
$Localadmingroupname = $LocalAdminGroup.name

# Get the list of all members of the Administrators group
$adminMembers = cmd.exe /c "Net localgroup `"$Localadmingroupname`"" | Out-String

# Split the members list into an array of users, removing empty lines and headers/footers
$adminMembersArray = $adminMembers -split "`r`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -and $_ -notmatch "command completed successfully" -and $_ -notmatch "^-+" -and $_ -ne $Localadmingroupname }

If ($Mode -eq "Install") {

    # Add curent user to the local administrator group
    if ($adminMembersArray -notcontains $loggedon) {
        cmd.exe /c "Net localgroup `"$Localadmingroupname`" /add `"$loggedon`""
    }
    else {
        "User is already a member of the `"$Localadmingroupname`" group"
    }
}

If ($Mode -eq "Uninstall") {

    # Remove curent user from the local administrator group
    if ($adminMembersArray -contains $loggedon) {
        cmd.exe /c "Net localgroup `"$Localadmingroupname`" /Delete `"$loggedon`""
    }
    else {
        "User is not a member of the `"$Localadmingroupname`" group"
    }
}