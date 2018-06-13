$users = get-aduser -filter {(enabled -eq "false")}
foreach ($user in $users)
{
$user | set-aduser -Add @{msExchHideFromAddressLists = "TRUE"}}
