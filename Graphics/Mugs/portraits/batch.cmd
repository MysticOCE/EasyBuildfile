@echo off

@cd %~dp0

@del png.txt

@dir *.png /b > png.txt

for /f "tokens=*" %%m in (png.txt) do PortraitFormatter.exe %%m

for /f "tokens=*" %%m in (png.txt) do echo %%m

fastmuggen.py

echo Done!

pause