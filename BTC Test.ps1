$tests = "Host,Port
hipv-xsp2.bell.ca,443
xsi-tor.totalconnect.bell.ca,443
xsi-mtl.totalconnect.bell.ca,443
67.69.241.29,443
67.69.237.49,443
67.69.241.201,443
67.69.237.201,443
sbc23-24toronto01.secure.btc.bell.ca,5061
sbc21-22montreal02.secure.btc.bell.ca,5061
sbc5-6halifax01.secure.btc.bell.ca,5061
sbc5-6calgary42.secure.btc.bell.ca,5061
184.150.213.164,5061
184.150.213.172,5061
142.177.151.188,5061
184.150.213.180,5061
xmpp.totalconnect.bell.ca,5222
67.69.237.67,5222
67.69.241.67,5222
xmpp.totalconnect.bell.ca,443
67.69.237.67,443
67.69.241.67,443
67.69.237.70,443
67.69.241.70,443
montreal8.voip.ms,5060
montreal8.voip.ms,5061"


Clear-Host

$data = ConvertFrom-Csv -InputObject $tests -Delimiter "," 


$results = $data | ForEach-Object {
    Test-NetConnection -ComputerName $_.Host -Port $_.Port -WarningAction SilentlyContinue 
} 

$results = $results | Select-Object ComputerName, RemotePort, TcpTestSucceeded | Sort-Object RemotePort, ComputerName

$results | Format-Table

Read-Host -Prompt "Press ENTER to continue"