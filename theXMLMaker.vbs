Set WshShell = WScript.CreateObject("WScript.Shell")
Set objArguments = WScript.Arguments
name = objArguments.Item(0)
password = objArguments.Item(1)
numberh = objArguments.Item(2)
interfc = objArguments.Item(3)

WshShell.Run("notepad")
WScript.Sleep(1000) 'waiting for notepad.exe
WshShell.SendKeys("<?xml version=""1.0""?>{ENTER}<WLANProfile xmlns=""http://www.microsoft.com/networking/WLAN/profile/v1"">{ENTER}") 'first 2 lines
WshShell.SendKeys("{TAB}<name>"&name&"</name>{ENTER}") ' 3rd line
WshShell.SendKeys("{TAB}<SSIDConfig>{ENTER}{TAB}{TAB}<SSID>{ENTER}") '  4 & 5 lines
WshShell.SendKeys("{TAB}{TAB}{TAB}<hex>"&numberh&"</hex>{enter}{TAB}{TAB}{TAB}<name>"&name&"</name>{ENTER}{TAB}{TAB}</SSID>{ENTER}") ' 6 , 7 & 8 lines
WshShell.SendKeys("{TAB}</SSIDConfig>{ENTER}") ' 9 line
WshShell.SendKeys("{TAB}<connectionType>ESS</connectionType>{ENTER}") ' 10 & 11
WshShell.SendKeys("{TAB}<connectionMode>auto</connectionMode>{ENTER}{TAB}<MSM>{ENTER}") '12 & 13
WshShell.SendKeys("{TAB}{TAB}<security>{ENTER}{TAB}{TAB}{TAB}<authEncryption>{ENTER}")
WshShell.SendKeys("{TAB}{TAB}{TAB}{TAB}<authentication>WPA2PSK</authentication>{ENTER}")
WshShell.SendKeys("{TAB}{TAB}{TAB}{TAB}<encryption>AES</encryption>{ENTER}")
WshShell.SendKeys("{TAB}{TAB}{TAB}{TAB}<useOneX>false</useOneX>{ENTER}")
WshShell.SendKeys("{TAB}{TAB}{TAB}</authEncryption>{ENTER}")
WshShell.SendKeys("{TAB}{TAB}{TAB}<sharedKey>{ENTER}{TAB}{TAB}{TAB}{TAB}<keyType>passPhrase</keyType>{ENTER}{TAB}{TAB}{TAB}{TAB}<protected>false</protected>{ENTER}")
WshShell.SendKeys("{TAB}{TAB}{TAB}{TAB}<keyMaterial>"&password&"</keyMaterial>{ENTER}{TAB}{TAB}{TAB}</sharedKey>{ENTER}")
WshShell.SendKeys("{TAB}{TAB}</security>{ENTER}{TAB}</MSM>{ENTER}</WLANProfile>{ENTER}")

'saving the file
WshShell.SendKeys("^g")
WScript.Sleep(8000)
WshShell.SendKeys(""&interfc&"-"&name&".xml")
WScript.Sleep(1000)
WshShell.SendKeys("{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}"&WshShell.CurrentDirectory&"{ENTER}") 'file's name
WScript.Sleep(1000)
WshShell.SendKeys("{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}")
WScript.Sleep(500)
WshShell.SendKeys("%{f4}")