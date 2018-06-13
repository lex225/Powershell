echo off
rem Below Are All Of The Exchange Services To Be Disabled...
echo Disabling Microsoft Exchange Active Directory Topology (Was Automatic Startup)
echo Note: This Service Seems To Be Flagged So It Cannot Be Stopped So I Added A TASKKILL Entry For It!
sc config MSExchangeADTopology start= disabled
sc stop MSExchangeADTopology
TASKKILL /F /IM MSExchangeADTopologyService.exe
echo Disabling Microsoft Exchange Address Book (Was Automatic Startup)
sc config MSExchangeAB start= disabled
sc stop MSExchangeAB
echo Disabling Microsoft Exchange Anti-spam Update (Was Automatic Startup)
sc config MSExchangeAntispamUpdate start= disabled
sc stop MSExchangeAntispamUpdate
echo Disabling Microsoft Exchange EdgeSync (Was Automatic Startup)
sc config MSExchangeEdgeSync start= disabled
sc stop MSExchangeEdgeSync
echo Disabling Microsoft Exchange File Distribution (Was Automatic Startup)
sc config MSExchangeFDS start= disabled
sc stop MSExchangeFDS
echo Disabling Microsoft Exchange Forms-Based Authentication service (Was Automatic Startup)
sc config MSExchangeFBA start= disabled
sc stop MSExchangeFBA
echo Disabling Microsoft Exchange IMAP4 (Was Manual Startup)
sc config MSExchangeImap4 start= disabled
sc stop MSExchangeImap4
echo Disabling Microsoft Exchange Information Store (Was Automatic Startup)
sc config MSExchangeIS start= disabled
sc stop MSExchangeIS
echo Disabling Microsoft Exchange Mail Submission (Was Automatic Startup)
sc config MSExchangeMailSubmission start= disabled
sc stop MSExchangeMailSubmission
echo Disabling Microsoft Exchange Mailbox Assistants (Was Automatic Startup)
sc config MSExchangeMailboxAssistants start= disabled
sc stop MSExchangeMailboxAssistants
echo Disabling Microsoft Exchange Mailbox Replication (Was Automatic Startup)
sc config MSExchangeMailboxReplication start= disabled
sc stop MSExchangeMailboxReplication
echo Disabling Microsoft Exchange Monitoring (Was Manual Startup)
sc config MSExchangeMonitoring start= disabled
sc stop MSExchangeMonitoring
echo Disabling Microsoft Exchange POP3 (Was Manual Startup)
sc config MSExchangePop3 start= disabled
sc stop MSExchangePop3
echo Disabling Microsoft Exchange Protected Service Host (Was Automatic Startup)
sc config MSExchangeProtectedServiceHost start= disabled
sc stop MSExchangeProtectedServiceHost
echo Disabling Microsoft Exchange Replication (Was Automatic Startup)
sc config MSExchangeRepl start= disabled
sc stop MSExchangeRepl
echo Disabling Microsoft Exchange RPC Client Access (Was Automatic Startup)
sc config MSExchangeRPC start= disabled
sc stop MSExchangeRPC
echo Disabling Microsoft Exchange Search Indexer (Was Automatic Startup)
sc config MSExchangeSearch start= disabled
sc stop MSExchangeSearch
echo Disabling Microsoft Exchange Server Extension for Windows Server Backup (Was Manual Startup)
sc config wsbexchange start= disabled
sc stop wsbexchange
echo Disabling Microsoft Exchange Service Host (Was Automatic Startup)
sc config MSExchangeServiceHost start= disabled
sc stop MSExchangeServiceHost
echo Disabling Microsoft Exchange System Attendant (Was Automatic Startup)
sc config MSExchangeSA start= disabled
sc stop MSExchangeSA
echo Disabling Microsoft Exchange Throttling (Was Automatic Startup)
sc config MSExchangeThrottling start= disabled
sc stop MSExchangeThrottling
echo Disabling Microsoft Exchange Transport (Was Automatic Startup)
sc config MSExchangeTransport start= disabled
sc stop MSExchangeTransport
echo Disabling Microsoft Exchange Transport Log Search (Was Automatic Startup)
sc config MSExchangeTransportLogSearch start= disabled
sc stop MSExchangeTransportLogSearch
echo Please Scroll Up To Check For Errors And Have A Great Day!
pause