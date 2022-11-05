@echo off
setlocal enabledelayedexpansion
pushd %~dp0
chcp 65001 >nul
set "bgblack=[40m"&set "bgyellow=[43m"&set "black=[30m"&set "red=[31m"&set "green=[32m"&set "yellow=[33m"&set "blue=[34m"&set "magenta=[35m"&set "cyan=[36m"&set "white=[37m"&set "grey=[90m"&set "brightred=[91m"&set "brightgreen=[92m"&set "brightyellow=[93m"&set "brightblue=[94m"&set "brightmagenta=[95m"&set "brightcyan=[96m"&set "brightwhite=[97m"&set "underline=[4m"&set "underlineoff=[24m"&set "bggreen=[102m"&set "bgred=[101m"&set "bgblue=[104m"&set "bgMagenta=[105m"&set "bgcyan=[106m"&set "bgWhite=[107m"&set "COMBINATIONS=[101;93m"&set "bgdarkblue=[44m"&set "bgdarkred=[41m"&set "dcyan=[36m"
:green
set g=!green!
set gg=!brightgreen!
set bg.g=!bggreen!

:red
set rr=!brightred!
set r=!red!
set bg.r=!bgred!
set bg.dr=!bgdarkred!

:blue
set c=!cyan!
set cc=!brightcyan!
set bg.c=!bgcyan!
set dc=!dcyan!
set bbb=!blue
set bb=!brightblue!
set bg.bb=!bgblue!
set bg.db=!bgdarkblue!

:yellow
set bg.y=!bgyellow!
set y=!yellow!
set yy=!brightyellow!

:purple
set p=!magenta!
set pp=!brightmagenta!
set bg.p=!bgMagenta!

:white
set w=!white!
set ww=!brightwhite!
set bg.w=!bgWhite!

:black
set bg.b=!bgblack!
set b=!black!

:grey
set g=!grey!

:font
set f.u=!underline!
set f.fo=!underlineoff!

:colors
set c.c=!COMBINATIONS!

:menu
cls
title killer X hack tool
echo %cc%
type logo\logo.txt
echo.
echo Type back at any stage of the software to return to the beginning
echo.
echo %bg.b%%cc%[1] Converter Tools  [2] ip Tools [3] Winrar Cracker
echo.
echo %cc%[4] Discord Tools  [5] Virus Tools  [6] Bots/Nukers
echo.
echo [7] Doxing Tool  [8] Spaming Tools
echo.
echo.
set /p if=Number: 
if %if%==1 goto Converter
if %if%==2 goto iptoolsX
if %if%==3 goto 3
if %if%==4 goto discordtools
if %if%==6 goto nuke
if %if%==7 goto doxing
if %if%==8 goto spam
if %if%==9 goto update

:Converter
cls
echo %pp%
type logo\logoConverter.txt
echo.
echo.
echo  [1] - py to exe
echo.
echo  [2] - js/nodejs to exe
echo.
echo  [3] - back
echo.
set /p if=Number: 
if %if%==1 goto py-to-exe
if %if%==2 goto js-to-exe
if %if%==3 goto menu
cls
goto menu

:py-to-exe
pip install auto-py-to-exe
auto-py-to-exe
goto Converter

:js-to-exe
start jsConverter\install.bat
start /b jsConverter\jsConverter.bat
exit

//ip tools X------------------------------------------------------------------------------------------

:iptoolsX
cls
echo %bb%
echo.
type logo\iptools.txt
echo.
echo.
echo [1] ip lookup  [2] ip pinger  [3] back to menu
echo.
set /p if=Number: 
if %if%==1 goto 1
if %if%==2 goto 2
if %if%==3 goto menu
if %if%==back goto menu
color 4
goto iptoolsX

:1
Ip Lookup
@echo off
title lilmums IP Lookup
color 5
mode con lines=13 cols=70
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
if exist "%temp%\%webclient%.vbs" del "%temp%\%webclient%.vbs" /f /q /s >nul
if exist "%temp%\response.txt" del "%temp%\response.txt" /f /q /s >nul
:menuu
cls
echo Ip lookup/

cls
echo.
echo                          Type  IP to lookup
echo.
set ip=127.0.0.1
set /p ip=IP: 
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs
:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting for API response. . .
echo  Looking up IP Address. . .
:checkresponseexists
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
color 5
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
pause
goto menuu
:response_exist
cls
echo.
echo   IP Results Listed Below
set /a num=(%Random%%%9)+1
color %num%
for /f "delims= 	" %%i in ('findstr /i "," %temp%\response.txt') do (
        set data=%%i
        set data=!data:,=!
	set data=!data:""=Not Listed!
	set data=!data:"=!
	set data=!data:ip:=IP:		!
	set data=!data:hostname:=Hostname:	!
	set data=!data:org:=ISP:		!
	set data=!data:city:=City:		!
	set data=!data:region:=State:	!
	set data=!data:country:=Country:	!
	set data=!data:postal:=Postal Code:	!
	set data=!data:loc:=Location:	!
	set data=!data:timezone:=Timezone:	!
        echo !data!
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
pause
if '%ip%'=='' goto menu
goto iplookup
pause
goto menuu
pause>nul
goto menu

:2
@Echo off
chcp 65001
cls
color 9
title IP Pinger
echo.
echo -CTRL+C TO STOP PINGING
echo -------------------------------------
set /p IP=Enter IP=
color 5
:top
PING -n 1 %IP% | FIND "TTL="
title ::Pinging! %IP%
IF ERRORLEVEL 1 (echo [OFFLINE] %IP% [OFFLINE])
set /a num= (%Random%%%9)+1
color %num%
ping -t 2 0 10 127.0.0.1 >nul
GoTo top
color 4
pause>nul
goto menu

//ip tools X------------------------------------------------------------------------------------------

//winrar X--------------------------------------------------------------------------------------------
:3
echo %yy%
REM ============================================================
REM errorcode401.blogspot.in
title Rar Password Cracker
mode con: cols=47 lines=20
copy "C:\Program Files\WinRAR\Unrar.exe"
SET PSWD=0
SET DEST=%TEMP%\%RANDOM%
MD %DEST%
:RAR
cls
echo ----------------------------------------------
echo GET DETAIL
echo ----------------------------------------------
echo.
SET/P "NAME=Enter File Name : "
IF "%NAME%"=="" goto NERROR
goto GPATH
:NERROR
echo ----------------------------------------------
echo ERROR
echo ----------------------------------------------
echo Sorry you can't leave it blank.
pause
goto RAR
:GPATH
SET/P "PATH=Enter Full Path : "
IF "%PATH%"=="" goto PERROR
goto NEXT
:PERROR
echo ----------------------------------------------
echo ERROR
echo ----------------------------------------------
echo Sorry you can't leave it blank.
pause
goto RAR
:NEXT
IF EXIST "%PATH%\%NAME%" GOTO START
goto PATH
:PATH
cls
echo ----------------------------------------------
echo ERROR
echo ----------------------------------------------
echo Opppss File does not Exist..
pause
goto RAR
:START

SET /A PSWD=%PSWD%+1
UNRAR E -INUL -P%PSWD% "%PATH%\%NAME%" "%DEST%"
IF /I %ERRORLEVEL% EQU 0 GOTO FINISH
GOTO START
:FINISH
RD %DEST% /Q /S
Del "Unrar.exe"
cls
echo ----------------------------------------------
echo CRACKED
echo ----------------------------------------------
echo.
echo PASSWORD FOUND!
echo FILE = %NAME%
echo CRACKED PASSWORD = %PSWD%
pause>NUL
exit
REM ============================================================

//winrar X--------------------------------------------------------------------------------------------

:doxing
cls
color 4                                                                                                   
echo            dddddddd                                                                                
echo           d::::::d                                     iiii                                       
echo            d::::::d                                    i::::i                                      
echo            d::::::d                                     iiii                                       
echo            d:::::d                                                                                 
echo    ddddddddd:::::d    ooooooooooo xxxxxxx      xxxxxxxiiiiiiinnnn  nnnnnnnn       ggggggggg   ggggg
echo  dd::::::::::::::d  oo:::::::::::oox:::::x    x:::::x i:::::in:::nn::::::::nn    g:::::::::ggg::::g
echo d::::::::::::::::d o:::::::::::::::ox:::::x  x:::::x   i::::in::::::::::::::nn  g:::::::::::::::::g
echo d:::::::ddddd:::::d o:::::ooooo:::::o x:::::xx:::::x    i::::inn:::::::::::::::ng::::::ggggg::::::gg
echo d::::::d    d:::::d o::::o     o::::o  x::::::::::x     i::::i  n:::::nnnn:::::ng:::::g     g:::::g 
echo d:::::d     d:::::d o::::o     o::::o   x::::::::x      i::::i  n::::n    n::::ng:::::g     g:::::g 
echo d:::::d     d:::::d o::::o     o::::o   x::::::::x      i::::i  n::::n    n::::ng:::::g     g:::::g 
echo d:::::d     d:::::d o::::o     o::::o  x::::::::::x     i::::i  n::::n    n::::ng::::::g    g:::::g 
echo d::::::ddddd::::::ddo:::::ooooo:::::o x:::::xx:::::x   i::::::i n::::n    n::::ng:::::::ggggg:::::g 
echo d:::::::::::::::::do:::::::::::::::ox:::::x  x:::::x  i::::::i n::::n    n::::n g::::::::::::::::g 
echo  d:::::::::ddd::::d oo:::::::::::oox:::::x    x:::::x i::::::i n::::n    n::::n  gg::::::::::::::g 
echo  ddddddddd   ddddd   ooooooooooo xxxxxxx      xxxxxxxiiiiiiii nnnnnn    nnnnnn    gggggggg::::::g 
echo                                                                                            g:::::g 
echo                                                                                gggggg      g:::::g 
echo                                                                               g:::::gg   gg:::::g 
echo                                                                                 g::::::ggg:::::::g 
echo                                                                                  gg:::::::::::::g  
echo                                                                                   ggg::::::ggg    
echo                                                                                       gggggg   
echo [1] name search/discord/...  echo [2] back
set /p answer="Number: "
if %answer%==1 goto 1
if %answer%==2 goto menu

:1
set /p search=search discord user name: 
echo.
echo.
color 6 && echo [youtube] && echo https://www.youtube.com/c/%search% && echo https://www.youtube.com/results?search_query=%search% 
echo.
echo.
color f && echo [GitHub] && echo https://github.com/%search% && echo https://github.com/search?q=%search%
echo.
echo.
echo [doxbin} && echo https://doxbin.org/upload/%search%
echo.
echo.
echo [instagram] https://www.instagram.com/%search%/
echo.
echo.
echo [facebook] https://www.facebook.com/%search%/
pause

:discordtools

cls
title killer X discord tools
echo %y%
type logo\logodis.txt
echo.
echo %bg.b%%y%[1] token checker  [2] id lookup  [3] account troller  [4] back
echo.
echo.
set /p if=Number: 
if %if%==1 goto 00
if %if%==2 goto idlookup
if %if%==3 goto acctroll
if %if%==4 cls & goto menu

@echo off
:00
title Discord Token Checker
echo Batch Token Checker
echo 1 - Check single token
echo 2 - Check tokens in "tokens.txt" 
echo 3 - rest tokeninfo
echo 0 - Exit  
set /p f=
if "%f%" == "0" exit
if "%f%" == "2" cls & goto 33
if "%f%" == "1" (cls & goto 11
if "%f%" == "3" (cls & goto 44
) else (cls & goto 00)
:11
set /p token=Your token: 
cls
curl --silent -H "Content-Type: application/json" -H "Authorization: %token%" https://discordapp.com/api/v8/users/@me > %temp%\tokeninfo.json
echo. >> tokeninfo.json
find /i "401: Unauthorized" %temp%\tokeninfo.json >NUL
if errorlevel 1 (
	color 2 & echo Token is either valid or locked :/
	curl --silent -H "Content-Type: application/json" -H "Authorization: %token%" https://discordapp.com/api/v8/users/@me >> tokeninfo.json
	echo Saved token info in tokeninfo.json
               if exist tokeninfo.json type tokeninfo.json
               if not exist tokeninfo.json echo.

) else (
	color 4 & echo Token is invalid!
	del %temp%\tokeninfo.json /q /f
	echo Saved token info in tokeninfo.json
)
set /P c=Do you want to check another token [Y/N]? 
if /I "%c%" EQU "Y" color 7 & cls & goto 11
if /I "%c%" EQU "N" goto 22
:22
exit
:33
if not exist "tokens.txt" echo "tokens.txt" not found! && goto 0
for /F "usebackq tokens=*" %%A in ("tokens.txt") do (
curl --silent -H "Content-Type: application/json" -H "Authorization: %%A" https://discordapp.com/api/v8/users/@me > %temp%\tokeninfo.json
find /i "401: Unauthorized" %temp%\tokeninfo.json >NUL
if errorlevel 1 (
	echo [Valid | Locked] %%A
	echo %%A >> tokeninfo.json
	echo.
	) else (
		echo [Invalid] %%A
		del %temp%\tokeninfo.json /q /f )
		)
echo Valid token are saved in "tokeninfo.json" (if any)
set /P idk=Do you want to return to main screen [Y/N]? 
if /I "%idk%" EQU "Y" cls & goto 00
if /I "%idk%" EQU "N" goto 2

:44
del tokeninfo.json
cls
goto 0
exit

:idlookup
start https://discord.id/
goto menu

:acctroll
start /b token-troller.exe


:nuke
cls
echo %ww%
echo.
type logo\killerXnuker.txt
echo.
echo discord nuke bot (:
echo.
echo [1] - start bot 
echo.
echo [2] - bot settings
echo.
echo [3] - check settings
echo.
echo [4] - back
echo.
set /p if=Number: 
if %if%==1 start /b main.exe
if %if%==2 start config.json
if %if%==3 type config.json
if %if%==4 cls & goto menu
cls
goto menu

:spam
cls
echo %ww%
echo.
type logo\spammer.txt
echo.
echo spaming
echo.
echo [1] - Webhook Spamer
echo.
echo [2] - UL -- Webhook Spamer
echo.
echo [3] - back
echo.
set /p if=Number: 
if %if%==1 goto webspam
if %if%==2 goto webspam2
if %if%==3 cls & goto menu
cls
goto menu

:webspam
SET /p WEBHOOK_URL=Webhook URL: 
set /p message=Webhook Message: 
set /p webhookname=Webhook Name: 
:webhookloop
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL%
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL%
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL%
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL%
goto webhookloop

:webspam2
SET /p WEBHOOK_URL=Webhook URL - 1: 
SET /p WEBHOOK_URL1=Webhook URL - 2: 
SET /p WEBHOOK_URL2=Webhook URL - 3: 
SET /p WEBHOOK_URL3=Webhook URL - 4: 
SET /p WEBHOOK_URL4=Webhook URL - 5: 
set /p message=Webhook Message: 
set /p webhookname=Webhook Name: 
:webhookloop2
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL%
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL1%
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL2%
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL3%
curl -H "Content-Type: application/json" -d "{\"username\": \"%webhookname%\", \"content\":\"%message%\"}" %WEBHOOK_URL4%
goto webhookloop2

