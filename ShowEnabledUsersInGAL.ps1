$users = get-aduser -filter {(enabled -eq "true") -and (msExchHideFromAddressLists -eq "TRUE")}
foreach ($user in $users)
{
$user | set-aduser -remove @{msExchHideFromAddressLists = $true}}
