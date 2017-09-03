@echo off
rem Spin up a myCMD terminal! (Long live Linux-like commands!)

rem This defines the location of your myCMD directory (ex: 'C:\tools\myCMD')
set MYCMDLOC=%~dp0

if exist "%MYCMDLOC%\startup.bat" goto readin
echo "%MYCMDLOC%startup.bat not found! Is your startup.bat in the right place?"
goto loopend

:readin
rem collect arguments, spawn terminal for each one if it is a dir
:loopstart
if .%1==. goto none
if exist %1\* (
	goto spawn
) else (
	goto baddir
)

:spawn
rem NOTE: Assumes that your startup script is called 'startup.bat'!
rem and that it is in the same directory as this script!
start "myCMD" /D %1 %MYCMDLOC%startup.bat
shift
if .%1==. goto loopend
goto :loopstart

:none
start "myCMD" %MYCMDLOC%startup.bat

:baddir
if not .%1==. echo '%1' is not a valid directory
shift
if .%1==. goto loopend
goto :loopstart

:loopend

