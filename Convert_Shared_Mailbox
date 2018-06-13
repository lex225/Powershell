$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

$upn = read-Host 'Mailbox to convert (UPN)'
$Manager = read-Host 'Who will manage the shared mailbox'

Set-Mailbox $upn -Type shared
Add-MailboxPermission -Identity $upn -User $Manager -AccessRights FullAccess
connect-msolservice -credential $UserCredential
#Remove the mailbox license
Set-MsolUserLicense -UserPrincipalName "$upn" -RemoveLicenses $_
