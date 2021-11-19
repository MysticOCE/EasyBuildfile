cd %~dp0

echo Running full make hack.

copy FE8_clean.gba myHack.gba

cd "%~dp0Tables"
echo: | (c2ea "%~dp0FE8_clean.gba" -installer "%base_dir%Tables/TableInstaller.event")

cd "%~dp0Text"
echo: | (textprocess_v2 text_buildfile.txt --parser-exe "%parsefile%" --installer "InstallTextData.event" --definitions "TextDefinitions.event")

cd "%~dp0EventAssembler"

ColorzCore A FE8 "-output:%~dp0myHack.gba" "-input:%~dp0ROM Buildfile.event" "--nocash-sym:%~dp0FE8Hack.sym" "--build-times"
type "%~dp0FE8_clean.sym" >> "%~dp0myHack.sym"

cd "%~dp0ups"

ups diff -b "%~dp0FE8_clean.gba" -m "%~dp0myHack.gba" -o "%~dp0myHack.ups"

pause
