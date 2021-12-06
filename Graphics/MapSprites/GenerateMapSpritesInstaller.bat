@echo off

@cd %~dp0/sms
@dir *.png /b > png.txt

Setlocal enabledelayedexpansion

Set "Pattern= "
Set "Replace=_"

For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)
@dir *.png /b > png.txt

Set "Pattern=,"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

@dir *.png /b > png.txt

Set "Pattern=("
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)
@dir *.png /b > png.txt
Set "Pattern=)"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)
@dir *.png /b > png.txt
Set "Pattern={"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)
@dir *.png /b > png.txt
Set "Pattern=}"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

@dir *.png /b > png.txt
Set "Pattern=-"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)


@cd %~dp0/mms

Set "Pattern= "
Set "Replace=_"

For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)
@dir *.png /b > png.txt

Set "Pattern=,"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

@dir *.png /b > png.txt

Set "Pattern=("
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)
@dir *.png /b > png.txt
Set "Pattern=)"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)
@dir *.png /b > png.txt
Set "Pattern={"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)
@dir *.png /b > png.txt
Set "Pattern=}"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

@dir *.png /b > png.txt
Set "Pattern=-"
Set "Replace="
For %%a in (*.png) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

@cd %~dp0/sms

@dir *.png /b > png.txt


@echo //Generated - do not edit!>GeneratedInstaller.txt
@echo //Copy paste the /* */ section into your definitions if desired.>>GeneratedInstaller.txt
@echo //Please copy the SetSMS and SetMMS section to change SMS size and MMS AP. >>GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt


@echo ^/^* >> GeneratedInstaller.txt
@echo //First free SMS is 107>> GeneratedInstaller.txt
setlocal enableextensions enabledelayedexpansion
set /a count = 107
@for /f "tokens=*" %%m in (png.txt) do (
echo #define %%~nm !count! >> GeneratedInstaller.txt
set /a count += 1
) 
endlocal 


@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt

@cd %~dp0/mms
@dir *.png /b > png.txt
@cd %~dp0

@echo //First free MMS is 127 and will show up if you've expanded classes.>> sms/GeneratedInstaller.txt
setlocal enableextensions enabledelayedexpansion
set /a count = 127
@for /f "tokens=*" %%m in (mms/png.txt) do (
echo #define %%~nm !count! >> sms/GeneratedInstaller.txt
set /a count += 1
) 
endlocal 


@cd %~dp0/sms

@echo. >> GeneratedInstaller.txt

@echo ^*^/ >> GeneratedInstaller.txt

@echo. >> GeneratedInstaller.txt

@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt

@echo ^/^* >> GeneratedInstaller.txt
@echo //Copy from here >> GeneratedInstaller.txt
@echo PUSH >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
@for /f "tokens=*" %%m in (png.txt) do (
echo SetSMS^(%%~nm, 1, %%~nm_Data^) >> GeneratedInstaller.txt
)
@echo. >> GeneratedInstaller.txt

@cd %~dp0
@echo. >> sms/GeneratedInstaller.txt
@for /f "tokens=*" %%m in (mms/png.txt) do (
echo SetMMS^(%%~nm, %%~nm_Data, DemonKingAP^) >> sms/GeneratedInstaller.txt
)


@cd %~dp0/sms

@echo. >> GeneratedInstaller.txt
@echo POP >> GeneratedInstaller.txt
@echo //Copy until here >> GeneratedInstaller.txt
@echo ^*^/ >> GeneratedInstaller.txt

@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt


@echo //SMS Image Data >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt

@for /f "tokens=*" %%m in (png.txt) do (
echo ALIGN 4 >> GeneratedInstaller.txt
echo %%~nm_Data: >> GeneratedInstaller.txt
echo #incbin "dmp/%%~nm.dmp" >> GeneratedInstaller.txt
echo. >> GeneratedInstaller.txt
)




@cd %~dp0

@echo. >> sms/GeneratedInstaller.txt

@echo. >> sms/GeneratedInstaller.txt

@echo. >> sms/GeneratedInstaller.txt


@echo //MMS Image Data >> sms/GeneratedInstaller.txt
@echo. >> sms/GeneratedInstaller.txt

@for /f "tokens=*" %%m in (mms/png.txt) do (
echo ALIGN 4 >> sms/GeneratedInstaller.txt
echo %%~nm_Data: >> sms/GeneratedInstaller.txt
echo #incbin "dmp/%%~nm.dmp" >> sms/GeneratedInstaller.txt
echo. >> sms/GeneratedInstaller.txt
)


@del "%~dp0sms\png.txt
@del "%~dp0mms\png.txt

@cd %~dp0

type %~dp0sms\GeneratedInstaller.txt > %~dp0sms\GeneratedInstaller.event

@copy "%~dp0sms\GeneratedInstaller.event" "%~dp0" > nul

@del "%~dp0sms\GeneratedInstaller.txt"
@del "%~dp0sms\GeneratedInstaller.event"



echo Done!

pause