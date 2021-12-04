
@echo off

cd %~dp0

echo Running fast make hack.

copy FE8_clean.gba myHack.gba

cd "%~dp0EventAssembler"

ColorzCore A FE8 "-output:%~dp0myHack.gba" "-input:%~dp0ROM Buildfile.event" "--nocash-sym:%~dp0FE8Hack.sym" "--build-times"
type "%~dp0FE8_clean.sym" >> "%~dp0myHack.sym"

cd "%~dp0ups"

ups diff -b "%~dp0FE8_clean.gba" -m "%~dp0myHack.gba" -o "%~dp0myHack.ups"

pause
