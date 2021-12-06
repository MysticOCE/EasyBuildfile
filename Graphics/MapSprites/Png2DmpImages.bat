@echo off

@set "Png2Dmp=%~dp0/../../EventAssembler/Tools/Png2Dmp.exe"

@cd %~dp0/sms

@dir *.png /b > png.txt

@for /f "tokens=*" %%m in (png.txt) do (
"%Png2Dmp%" "%%m" --lz77
echo %%m
)

@del png.txt

@cd %~dp0

@copy "%~dp0sms\*.dmp" "%~dp0Dmp" > nul

@del "%~dp0sms\*.dmp"


@cd %~dp0/mms

@dir *.png /b > png.txt

@for /f "tokens=*" %%m in (png.txt) do (
"%Png2Dmp%" "%%m" --lz77
echo %%m
)

@del png.txt

@cd %~dp0

@copy "%~dp0mms\*.dmp" "%~dp0Dmp" > nul

@del "%~dp0mms\*.dmp"


echo Done!

pause