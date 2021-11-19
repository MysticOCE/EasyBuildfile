@echo off

@cd %~dp0/Png
@dir *.png /b > png.txt
@echo //Generated - do not edit!>GeneratedInstaller.txt
@echo //Copy paste the /* */ section into your definitions if desired.>>GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt


@echo ^/^* >> GeneratedInstaller.txt
@echo ^/^/First free icon past vanilla is 222 / 0xDE >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
setlocal enableextensions enabledelayedexpansion
set /a count = 222
@for /f "tokens=*" %%m in (png.txt) do (
echo #define %%~nmIcon !count! >> GeneratedInstaller.txt
set /a count += 1
) 
endlocal 

@echo ^*^/ >> GeneratedInstaller.txt

@echo. >> GeneratedInstaller.txt

@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt


@echo //Image Data >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
@echo PUSH >> GeneratedInstaller.txt
@echo. >> GeneratedInstaller.txt
@for /f "tokens=*" %%m in (png.txt) do (
echo ItemIconEntry^(%%~nmIcon^) >> GeneratedInstaller.txt
echo #incbin "dmp/%%~nm.dmp" >> GeneratedInstaller.txt
echo. >> GeneratedInstaller.txt
)

@echo POP >> GeneratedInstaller.txt

@del png.txt

@cd %~dp0

type %~dp0Png\GeneratedInstaller.txt > %~dp0Png\GeneratedInstaller.event

@copy "%~dp0Png\GeneratedInstaller.event" "%~dp0" > nul

@del "%~dp0Png\GeneratedInstaller.txt"
@del "%~dp0Png\GeneratedInstaller.event"



echo Done!

pause