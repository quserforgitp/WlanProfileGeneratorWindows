@echo off                                                                                                              
		Title WlanProfileGeneratorTool
		:start
		mode con cols=169 lines=57 &rem this is in order to fill the screen with the prompt
		color 0b
		rem echo %number% %name% %ssidconf% %key% %keyconf% %hex% %interface% %interfaceconf% %save% %profile%
		rem echo %profileconf% %folder% %folderconf% %keyclear% %iprofile% %iprofileconf% %selectprofile%
		rem echo %delprofile% %connectprofile% %connectprofileconf%

                            		REM settning variables to empty values
		Set number=
		Set name=
		Set ssidconf=
		Set key=
		Set keyconf=
		Set hex=
		Set interface=
		Set interfaceconf=
		Set save=
		Set profile=
		Set profileconf=
		Set folder=
		Set folderconf=
		Set keyclear=
		Set iprofile=
		Set iprofileconf=
		Set selectprofile=
		Set delprofile=
		Set connectprofile=
		Set connectprofileconf=
		rem echo now it isn't here

		rem echo %number% %name% %ssidconf% %key% %keyconf% %hex% %interface% %interfaceconf% %save% %profile%
		rem echo %profileconf% %folder% %folderconf% %keyclear% %iprofile% %iprofileconf% %selectprofile%
		rem echo %delprofile% %connectprofile% %connectprofileconf%
rem pause
		color 0b
		cls
echo                                                  _____________                 
echo                                                 / \/ \/ \/ \/ \                
echo                                               "( W | L | A | N )"              
echo                                                 \_/\_/\_/\_/\_/                
echo                                            _________________________    
echo                                           / \ / \ / \ / \ / \ / \ / \  
echo                                         "( P | r | o | f | i | l | e )"
echo                                           \_/ \_/ \_/ \_/ \_/ \_/ \_/  
echo.
echo                                        _________________________________     
echo                                       / \ / \ / \ / \ / \ / \ / \ / \ / \  
echo                                     "( G | e | n | e | r | a | t | o | r )"
echo                                       \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/  
echo                                              _     _____________
echo                                             / \   / \ / \ / \ / \ 
echo                                           "( v ) ( . | 0 | . | 1 )"
echo                                             \_/   \_/ \_/ \_/ \_/ 	
echo.
echo.
echo.
echo                                        _  _     _____________________
echo                                       / \/ \   / \ / \ / \ / \ / \ / \ 
echo                                     "(  by  ) ( A | u | t | H | o | r )"
echo                                       \_/\_/   \_/ \_/ \_/ \_/ \_/ \_/ 	
echo.
echo. 
echo.
echo                           _______________________________________________________
echo                          "                                                       "
echo                          "     1      =   Generate Profile                       "
echo                          "     2      =   Show Networks                          "
echo                          "     3      =   Show Interfaces(WLAN)                  "
echo                          "     4      =   Show Profiles                          "
echo                          "     5      =   Export Profile (XML)                   "
echo                          "     6      =   Import Profile (XML)                   "
echo                          "     7      =   Connect to a Network                   "
echo                          "     8      =   Disconnect From Net                    "
echo                          "     9      =   Delete profile                         "
echo                          "     help   =      HELP                                "
echo                          " 10 or exit =      Exit                                "
echo                          "_______________________________________________________"
echo.

		


		set /p number="Enter The Option (number) ->"
        
		if [%number%]==[] goto invalidEntry
        if NOT %number%==1 if NOT %number%==2 if NOT %number%==3 if NOT %number%==4 if NOT %number%==5 if NOT %number%==6 if NOT %number%==7 if NOT %number%==8 if NOT %number%==9 if NOT %number%==help if NOT %number%==10 if NOT %number%==exit (goto invalidEntry)

		if %number%==1 (goto generateProfile)
		if %number%==2 (goto showNetworks)
		if %number%==3 (goto showInterfaces)
		if %number%==4 (goto showProfiles)
		if %number%==5 (goto exportProfile)
		if %number%==6 (goto importProfile)
		if %number%==7 (goto connectToANetwork)
		if %number%==8 (goto disconnectFromNet)
		if %number%==help (goto help)
		if %number%==9 (goto deleteProfile)
		if %number%==10  (goto end)
		if %number%==exit (goto end)

:invalidEntry
echo 
color 0c
echo.
echo.
echo                            *!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
echo                            *!                            !*
echo                            *! INVALID ENTRY ! TRY AGAIN! !*
echo                            *!                            !*
echo                            *!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
echo.
echo.
echo.
pause
goto start
		

:generateProfile
color 0e
cls
echo.
echo.
echo  *---------------------------------------*
echo  *                                       *
echo  "[**]Generate Profile Has been selected!"
echo  *                                       *
echo  *                                       *
echo  -----------------------------------------
echo.
echo.
echo.
:resetSsid
Set ssidconf=
Set name=
Set /p name="Enter the network's ssid -> "
if [%name%]==[back] goto start
echo.
echo.
     Set /p ssidconf="Are You Sure you want to enter this value? -> %name% (Y/n) "
     if [%ssidconf%]==[back] goto resetSsid
     echo.
     if NOT [%ssidconf%]==[y] if NOT [%ssidconf%]==[Y] If NOT [%ssidconf%]==[] (goto resetSsid)
echo                        "[*] SSID has been setted ---> %name%"     
echo.
echo.
:resetKey
	Set key=
	Set keyconf=
    Set /p key="Enter the network's key(Password)-> "
    if [%key%]==[back] goto start
    Set /p keyconf="Are You Sure you want to enter this value? -> %key% (Y/n) "
    if [%keyconf%]==[back] goto resetKey
    if NOT [%keyconf%]==[y] if NOT [%keyconf%]==[Y] if NOT [%keyconf%]==[] (goto resetKey)
echo.
echo.
echo                        "[*] Password has been setted ---> %key%"
	cls
echo.
echo		CALLING the ASSCII2HEXConverter......
echo.
	call AsciiToHexConverter.bat %name%

:resetHex
     Set /p hex=""<enc.txt
     del enc.txt && echo FILE DELETED..
     rem Set /p hexconf="Are You Sure you want to enter this value? -> %hex% y/n "
     rem echo %hexconf%
     rem if NOT %hexconf%==y goto resetHex
echo.
echo.
echo                        "[*] Hex has been setted ---> %hex%"
echo.
	netsh wlan show interfaces | more
echo.
echo.

:resetInterface
	Set interface=
	Set interfaceconf=
	echo {*} IF THE NAME CONTAINS BLANKS PUT THE NAME within DOUBLE QUOTES : example "Wi-Fi 1"
     Set /p interface="Enter the interface's name to attach this profile->"
     echo %interface%
     if [%interface%]==[back] goto start
     rem Set almostsetted="%interface%"
     rem echo %almostsetted%
     pause
     Set /p interfaceconf="Are You Sure you want to enter this value? -> %interface% (Y/n) "
     if [%interfaceconf%]==[back] goto resetInterface
     if NOT [%interfaceconf%]==[y] if NOT [%interfaceconf%]==[Y] if NOT [%interfaceconf%]==[] (goto resetInterface)
echo.
echo.
echo                        "[*] Interface has been setted ---> %interface%"
echo.
echo.  Parsing values...
echo [°                                                    ]1%%
ping localhost -n 2 >nul
cls
echo  Parsing values....
echo [°°°°°°°°°°°°                                         ]27%%
ping localhost -n 2 >nul
call cscript //nologo theXMLMaker.vbs %name% %key% %hex% %interface%
     ping localhost -n 5 >nul
echo.
echo.
cls
echo  Parsing values........
echo [°°°°°°°°°°°°°°°°°°°°°°°°                             ]64%%
ping localhost -n 2 >nul
cls
echo  Parsing values..........
echo [°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°]100%%
ping localhost -n 2 >nul
cls
Set save=
Set /p save="Do you want to save the file ? (Y/n) -> "
	if [%save%]==[back] goto generateProfile
    if NOT [%save%]==[y] if NOT [%save%]==[Y] if NOT [%save%]==[] (echo DELETING files... && del *.xml)
	ping localhost -n 2 >nul
	cls
echo IF YOU are getting problems with the connection please wait a while...
echo sometimes when the machine is trying to connect to a new network, it displays:
echo network not identified, or no interntet access, but this just is for a while.
echo wait 10 seconds, so you'll see the connection will be established succesfully
echo.
echo once the connection has been established run the command "ping -n 10 8.8.8.8 || ping -n 10 www.google.com" 
echo to make it sure that the connection has been established
pause
cls
echo                      We're done!!!
echo.
echo.
	ping localhost -n 2 > nul
cls
goto start

:showNetworks
cls
color 0a
echo  *---------------------------------------*
echo  *                                       *
echo  "[**]Show Networks Has Been Selected!"  *
echo  *                                       *
echo  *                                       *
echo  -----------------------------------------
echo.
netsh wlan show networks | more
pause
cls
goto start

:showInterfaces
cls
color 0a
echo.
echo.
echo  *---------------------------------------*
echo  *                                       *
echo  "[**]Show Interfaces Has Been Selected!"*
echo  *                                       *
echo  *                                       *
echo  -----------------------------------------
echo.
echo.
echo.
netsh wlan show interfaces * | more
pause
cls
goto start

:showProfiles
cls
color 0a
echo.
echo.
echo  *---------------------------------------*
echo  *                                       *
echo  "[**]Show Profiles Has Been Selected !" *
echo  *                                       *
echo  *                                       *
echo  -----------------------------------------
	ping localhost -n 2 >nul
echo.
echo.
echo.
netsh wlan show profiles * | more
pause
cls
goto start

:exportProfile
cls
color 0a
echo.
echo.
echo  *---------------------------------------*
echo  *                                       *
echo  "[**]Export Profile Has been selected!"
echo  *                                       *
echo  *                                       *
echo  -----------------------------------------
		ping localhost -n 2 >nul
echo.
echo.
echo.
	netsh wlan show profiles | more
:resetExportProfile
	set profile=
	set profileconf=
	set /p profile="Enter a profile from the list above -> "
	if [%profile%]==[back] goto start

echo.
echo.
	set /p profileconf="Are you sure you want to enter this value? -> %profile% (Y/n) "
	if [%profileconf%]==[back] goto exportProfile
	if NOT [%profileconf%]==[y] if NOT [%profileconf%]==[Y] if NOT [%profileconf%]==[] (goto resetExportProfile)
echo.
echo.
echo                        "[*] Profile has been setted ---> %profile%"
echo.
echo.
:resetFolder
echo 						CURRENT PATH: %cd%
cd
echo.
echo. 
Set folder=
Set folderconf=
Set keyclear=
Set keyisntclear=
Set profileconf=
	set /p folder="Enter the path where want to store the profile --> "
	if [%folder%]==[back] goto exportProfile 
echo.
	set /p folderconf="Are you sure you want to enter this value? -> %folder% (Y/n) "
	if [%folderconf%]==[back] goto exportProfile
	if NOT [%folderconf%]==[y] if NOT [%folderconf%]==[Y] if NOT [%folderconf%]==[] (goto resetExportProfile)
echo.
echo.
	set /p keyclear="Do you want to make the key clear ?(show passwords in XML files) (Y/n)--> "
	if [%keyclear%]==[back] goto exportProfile
	if NOT [%profileconf%]==[y] if NOT [%profileconf%]==[Y] if NOT [%profileconf%]==[] (goto keyisntclear)
	netsh wlan export profile name=%profile% folder=%folder% key=clear
	goto jump
:keyisntclear
	netsh wlan export profile name=%profile% folder=%folder%
:jump
pause
cls
goto start

:importProfile
cls
color 0a
echo.
echo.
echo  *---------------------------------------*
echo  *                                       *
echo  "[**]Import Profile Has been selected!" *
echo  *                                       *
echo  *                                       *
echo  -----------------------------------------
echo.
echo.
echo.
echo.
echo.
echo			CURRENT DIRECTORY: %cd%
:resetImportProfile
	Set iprofile=
	Set iprofileconf=
	Set selectprofile=
	set /p iprofile="Enter the .xml profile file path -> "
	if [%iprofile%]==[back] goto start
echo.
echo.
	set /p iprofileconf="Are you sure you want to enter this value? %iprofile% (Y/n)-> "
	if [%iprofileconf%]==[back] goto importProfile
	if NOT [%iprofileconf%]==[y] if NOT [%iprofileconf%]==[Y] if NOT [%iprofileconf%]==[] (goto resetImportProfile)
	netsh wlan show interfaces | more
echo.
echo.
	netsh wlan add profile filename=%iprofile% 
	 echo Wait the connection is being perfoming.....&&ping localhost -n 4 >nul
	netsh wlan disconnect && echo Restarting connection.....&& ping localhost -n 2 >nul
	netsh wlan show profiles | more
	Set /p selectprofile="Please copy and paste the profile's name here-> "
	if [%selectprofile%]==[back] goto importProfile
	netsh wlan connect name=%selectprofile% interface=*
pause
cls
goto start

:deleteProfile
Set delprofile=
cls
color 0d
echo.
echo.
echo  *---------------------------------------*
echo  *                                       *
echo  "[**]Delete Profile Has been selected!" *
echo  *                                       *
echo  *                                       *
echo  -----------------------------------------
echo.
echo.
echo.
echo.
echo.
netsh wlan show profiles | more
Set /p delprofile="Please copy and paste the profile's name that you want to delete here -> "
if [%delprofile%]==[back] goto start
netsh wlan delete profile name=%delprofile%
echo                           Deleting profile.....
ping localhost -n 2 >nul
netsh wlan show profiles | more
pause
goto start 


:connectToANetwork
cls
color 0a
echo.
echo.
echo  *--------------------------------------------*
echo  *                                            *
echo  "[**]Connect to a Network Has been selected!"*
echo  *                                            *
echo  *                                            *
echo  ----------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.

:resetProfileConnection
	netsh wlan show profiles | more
Set connectprofile=
Set connectprofileconf=
	Set /p connectprofile="Enter the profile name --> "
	if [%connectprofile%]==[back] goto start
	if [%connectprofile%]==[] (echo You didn't enter any value & ping localhost -n 2 >nul & cls & goto resetProfileConnection)
	Set /p connectprofileconf="Are you sure you want enter this value? %connectprofile% (Y/n)--> "
	if NOT [%connectprofileconf%]==[y] if NOT [%connectprofileconf%]==[Y] if NOT [%connectprofileconf%]==[] (goto connectToANetwork)
	netsh wlan connect name=%connectprofile%
echo.
echo      TESTING NETWORK'S INTERNET CONNECTION.....
	
	ping localhost -n 2 >nul

	ping -n 3 8.8.8.8 || ping -n 3 www.google.com
pause
cls
goto start

:disconnectFromNet
set makedes=
cls
color 0a
echo.
echo.
echo  *----------------------------------------------- *
echo  *                                                *
echo  "[**]Disconnect from Network Has been selected!" *
echo  *                                                *
echo  *                                                *
echo  --------------------------------------------------
echo.
echo.
Set /p makedes="Are you sure you want to disconnect from the current network? (Y/n)-> "
if not [%makedes%]==[Y] if not [%makedes%]==[y] if not [%makedes%]==[]  (goto start)
echo.
echo.
:perfDisc
echo.
echo 						Disconnecting from the network....
echo.
echo.
	ping localhost -n 2 >nul
	netsh wlan disconnect	
	cls
	echo D O N E  !!! 
	ping localhost -n 2 >nul
cls
goto start

:help
cls
color b0
echo  This program was intended for make xml Wlan profiles
echo  Which are necessary to connect to a network from cmd.
echo.
echo.
echo  			Select the option that you want to perform by typing the number placed on the right of the option's name.
echo.
echo.
echo 			-for example select the option " 1 " in order to create a profile that can be imported (Option "6") to connect to a network
echo.
pause
echo.
echo.
echo.
echo.
echo                        -__-----______---SIMPLE USAGE---______-----__-
echo.
echo.
echo.
echo.
echo			In order to make a WLAN PROFILE based on a network information, you need to know:
echo			1.- Network's SSID 
echo			2.- Network's Password
echo.			3.- Your computer's Interfaces (The netcard either wlan or lan)
echo.
echo.
echo			Create a profile to attach to a network
echo                       1.- type 1 (Generate a profile) and hit Enter
echo                       2.- follow the instructions and save the xml.
echo                       3.- type 6 (Import a profile) and hit Enter
	pause
echo.
echo.
echo.
echo                 1.- WHEN YOU ARE ON AN ENVIRONMENT e.g. you typed the number 1 and thus entered
echo                 into generateProfile environment, so you can type the "back" word (without)
echo                 quotes in order to back to the previous environment (main menu in this case)
echo.
echo                 2.- When you are being prompted with the (Y/n) at the end of the line, it means that
echo                 the default option is the "Y" letter because it's the uppercase letter on the parenthesis.
echo                 (if you hit enter and you didn't put any value either "y" or "n" the system goes as if you
echo                  entered the "y" value)
echo.
echo						that's it!!! now you should be connected to a network
echo.
pause 
	goto start
		
:end
	cls
	color 0f
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                            _________
echo                                                    --------by Author--------
echo                                                    -------------------------
	ping localhost -n 3 >nul                     
	cls&&color a 
	exit /b 0