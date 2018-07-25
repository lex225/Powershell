# Establish a PowerShell session with Office 365. You'll be prompted for your Delegated Admin credentials
$Cred = Get-Credential
Connect-MsolService -Credential $Cred
# To exclude a customer add the Customer name below, to run on a single customer change notmach to match
$customers = Get-MsolPartnerContract| Where-Object {$_.name -notmatch "Customer1" -or $_.name -notmatch "Customer2" -or $_.name -notmatch "Customer3"}
Write-Host "Found $($customers.Count) customers for $((Get-MsolCompanyInformation).displayname)."
 
foreach ($customer in $customers) {
    $InitialDomain = Get-MsolDomain -TenantId $customer.TenantId | Where-Object {$_.IsInitial -eq $true}
           
    Write-Host "Checking inbox rules and delegates for $($Customer.Name)" -ForegroundColor Green
    $DelegatedOrgURL = "https://outlook.office365.com/powershell-liveid?DelegatedOrg=" + $InitialDomain.Name
    $s = New-PSSession -ConnectionUri $DelegatedOrgURL -Credential $Cred -Authentication Basic -ConfigurationName Microsoft.Exchange -AllowRedirection
    Import-PSSession $s -CommandName Get-Mailbox, Get-InboxRule , Get-MailboxPermission -AllowClobber
      
   $allUsers = @()
		$AllUsers = Get-MsolUser -TenantId $customer.TenantId -EnabledFilter EnabledOnly | select ObjectID, UserPrincipalName, FirstName, LastName, StrongAuthenticationRequirements, StsRefreshTokensValidFrom, StrongPasswordRequired, LastPasswordChangeTimestamp | Where-Object {($_.UserPrincipalName -notlike "*#EXT#*")}

		$UserInboxRules = @()
		$UserDelegates = @()

		foreach ($User in $allUsers)
		{
			Write-Host "Checking inbox rules and delegates for user: " $User.UserPrincipalName;
			$UserInboxRules += Get-InboxRule -Mailbox $User.UserPrincipalname | Select Name, Description, Enabled, Priority, ForwardTo, ForwardAsAttachmentTo, RedirectTo, DeleteMessage | Where-Object {($_.ForwardTo -ne $null) -or ($_.ForwardAsAttachmentTo -ne $null) -or ($_.RedirectsTo -ne $null)}
			$UserDelegates += Get-MailboxPermission -Identity $User.UserPrincipalName | Where-Object {($_.IsInherited -ne "True") -and ($_.User -notlike "*SELF*")}
		}

		$SMTPForwarding = Get-Mailbox -ResultSize Unlimited | select DisplayName,ForwardingAddress,ForwardingSMTPAddress,DeliverToMailboxandForward | where {$_.ForwardingSMTPAddress -ne $null}

            $UserInboxRules | Export-Csv "$($Customer.Name) Forwarding Rules To External Domains.csv"
            $UserDelegates | Export-Csv "$($Customer.Name) Mailbox Delegate Permissions.csv"
            $SMTPForwarding | Export-Csv "$($Customer.Name) Mailbox smtp forwarding.csv"
    Remove-PSSession $s
}