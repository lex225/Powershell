@echo off
rem Below Are All Of The Exchange Services To Be Enabled...
echo Enabling Microsoft Exchange Active Directory Topology (Is Now Automatic Startup)
sc config MSExchangeADTopology start= auto
sc start MSExchangeADTopology
echo Enabling Microsoft Exchange Address Book (Is Now Automatic Startup)
sc config MSExchangeAB start= auto
sc start MSExchangeAB
echo Enabling Microsoft Exchange Anti-spam Update (Is Now Automatic Startup)
sc config MSExchangeAntispamUpdate start= auto
sc start MSExchangeAntispamUpdate
echo Enabling Microsoft Exchange EdgeSync (Is Now Automatic Startup)
sc config MSExchangeEdgeSync start= auto
sc start MSExchangeEdgeSync
echo Enabling Microsoft Exchange File Distribution (Is Now Automatic Startup)
sc config MSExchangeFDS start= auto
sc start MSExchangeFDS
echo Enabling Microsoft Exchange Forms-Based Authentication service (Is Now Automatic Startup)
sc config MSExchangeFBA start= auto
sc start MSExchangeFBA
echo Enabling Microsoft Exchange IMAP4 (Is Now Manual Startup)
sc config MSExchangeImap4 start= demand
sc start MSExchangeImap4
echo Enabling Microsoft Exchange Information Store (Is Now Automatic Startup)
sc config MSExchangeIS start= auto
sc start MSExchangeIS
echo Enabling Microsoft Exchange Mail Submission (Is Now Automatic Startup)
sc config MSExchangeMailSubmission start= auto
sc start MSExchangeMailSubmission
echo Enabling Microsoft Exchange Mailbox Assistants (Is Now Automatic Startup)
sc config MSExchangeMailboxAssistants start= auto
sc start MSExchangeMailboxAssistants
echo Enabling Microsoft Exchange Mailbox Replication (Is Now Automatic Startup)
sc config MSExchangeMailboxReplication start= auto
sc start MSExchangeMailboxReplication
echo Enabling Microsoft Exchange Monitoring (Is Now Manual Startup)
sc config MSExchangeMonitoring start= demand
sc start MSExchangeMonitoring
echo Enabling Microsoft Exchange POP3 (Is Now Manual Startup)
sc config MSExchangePop3 start= demand
sc start MSExchangePop3
echo Enabling Microsoft Exchange Protected Service Host (Is Now Automatic Startup)
sc config MSExchangeProtectedServiceHost start= auto
sc start MSExchangeProtectedServiceHost
echo Enabling Microsoft Exchange Replication (Is Now Automatic Startup)
sc config MSExchangeRepl start= auto
sc start MSExchangeRepl
echo Enabling Microsoft Exchange RPC Client Access (Is Now Automatic Startup)
sc config MSExchangeRPC start= auto
sc start MSExchangeRPC
echo Enabling Microsoft Exchange Search Indexer (Is Now Automatic Startup)
sc config MSExchangeSearch start= auto
sc start MSExchangeSearch
echo Enabling Microsoft Exchange Server Extension for Windows Server Backup (Is Now Manual Startup)
sc config wsbexchange start= demand
sc start wsbexchange
echo Enabling Microsoft Exchange Service Host (Is Now Automatic Startup)
sc config MSExchangeServiceHost start= auto
sc start MSExchangeServiceHost
echo Enabling Microsoft Exchange System Attendant (Is Now Automatic Startup)
sc config MSExchangeSA start= auto
sc start MSExchangeSA
echo Enabling Microsoft Exchange Throttling (Is Now Automatic Startup)
sc config MSExchangeThrottling start= auto
sc start MSExchangeThrottling
echo Enabling Microsoft Exchange Transport (Is Now Automatic Startup)
sc config MSExchangeTransport start= auto
sc start MSExchangeTransport
echo Enabling Microsoft Exchange Transport Log Search (Is Now Automatic Startup)
sc config MSExchangeTransportLogSearch start= auto
sc start MSExchangeTransportLogSearch
echo Please Scroll Up To Check For Errors And Have A Great Day!
pause