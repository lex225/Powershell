$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

$Mailboxes = Get-Mailbox
$Results = foreach( $Mailbox in $Mailboxes ){
    $Folders = $MailBox |
        Get-MailboxFolderStatistics |
        Measure-Object |
        Select-Object -ExpandProperty Count
    New-Object -TypeName PSCustomObject -Property @{
        Username    = $Mailbox.Alias
        FolderCount = $Folders
        }
    }
$Results | Select-Object -Property Username, FolderCount | Sort FolderCount -Descending
