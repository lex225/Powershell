install-windowsfeature AD-Domain-Services

Import-Module ADDSDeployment

Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath “C:\Windows\NTDS” -DomainMode “Win2016” -DomainName “ad.lex225.com” -DomainNetbiosName “LEX225” -ForestMode “Win2016” -InstallDns:$true -LogPath “C:\Windows\NTDS” -NoRebootOnCompletion:$false -SysvolPath “C:\Windows\SYSVOL” -Force:$true
