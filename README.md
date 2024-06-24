# AddCurrentLoggedOnUserToLocalGroup
- Script to add or remove the current logged on user from a local group
- Handy for software such as Docker or Hyper-V, as well as when you need to add users to local groups such as administrators.

**Intune Install command:**
`%windir%\sysnative\windowspowershell\v1.0\powershell.exe -executionPolicy bypass -windowstyle hidden -file .\Install.ps1 -Mode Install`

**Intune Uninstall command:**
`%windir%\sysnative\windowspowershell\v1.0\powershell.exe -executionPolicy bypass -windowstyle hidden -file .\Install.ps1 -Mode Unnstall`

**Blog:** [Add Current Logged on User to a Local Group Using Win32 App](https://tunemdm.com/2024/06/24/add-current-logged-on-user-to-a-local-group-using-win32-app/)


