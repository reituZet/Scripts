strComputer = "."
Set SWBemlocator = CreateObject("WbemScripting.SWbemLocator")
Set objWMIService = SWBemlocator.ConnectServer(strComputer,"root\CIMV2")
Set colItems = objWMIService.ExecQuery("Select * from Win32_NetworkAdapterConfiguration where ipenabled = true",,48)
For Each objItem in colItems
	Text = "Имя компьютера: " & objItem.DNSHostName & VbCrLf
	for each propValue in objItem.IPAddress
		Text = Text & "IP адрес: " & propValue & VbCrLf 
	Next
Next
 WScript.Echo Text