@echo off
setlocal EnableDelayedExpansion
rem -- Run gimp 2.8 --
rem Check if you've set your executable location in your startup.bat
if "%GIMP_EXE_DIR%"== "" (
	echo GIMP_EXE_DIR not set^^! Do you need to add it to your startup.bat?
	goto eof
)

if exist "%GIMP_EXE_DIR%\gimp-2.8.exe" goto havegimp
echo "%GIMP_EXE_DIR%\gimp-2.8.exe not found^!"
goto eof

:havegimp
set GIMPARGS=
:loopstart
if .%1==. goto loopend
rem This line will resolve the full path for each file passed in; including for use of wildcards
rem Needed because gimp-2.8.exe does not accomodate wildcards
for %%a in (%1) do set GIMPARGS=!GIMPARGS! "%%~dpnxa"
shift
goto loopstart

:loopend
start "" "%GIMP_EXE_DIR%\gimp-2.8.exe" %GIMPARGS%
goto eof

:eof
set GIMPARGS=
