<#
.SYNOPSIS
    RPC-Ping.ps1 - Test an RPC connection against one or more computer(s)
.DESCRIPTION
    RPC-Ping - Test an RPC connection (WMI request) against one or more computer(s)
    with test-connection before to see if the computer is reachable or not first
.PARAMETER ComputerName
    Defines the computer name or IP address to tet the RPC connection. Could be an array of servernames
    Mandatory parameter.
.NOTES
    File Name   : RPC-Ping.ps1
    Author      : Fabrice ZERROUKI - fabricezerrouki@hotmail.com
.EXAMPLE
    PS D:\> .\RPC-Ping.ps1 -ComputerName SERVER1
    Open an RPC connection against SERVER1
.EXAMPLE
    PS D:\> .\RPC-Ping.ps1 -ComputerName SERVER1,192.168.0.23
    Open an RPC connection against SERVER1 and 192.168.0.23
#>
Param(
    [Parameter(Mandatory=$true, HelpMessage="You must provide a computername or an IP address to test")]
    [string[]]$ComputerName
    )
ForEach ($Computer in $ComputerName) {
    if (Test-Connection -ComputerName $Computer -Quiet -Count 1)
    {
       if (Get-WmiObject win32_computersystem -ComputerName $Computer -ErrorAction SilentlyContinue) {
       Write-Host "RPC connection on computer $Computer successful." -ForegroundColor DarkGreen;
       }
       else {Write-Host "RPC connection on computer $Computer failed!" -ForegroundColor DarkRed;}
    }
    else {Write-Host "Computer $Computer doesn't even responds to ping..." -ForegroundColor DarkRed;}
}