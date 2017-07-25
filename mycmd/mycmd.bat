@echo off
rem Spin up a myCMD terminal! (Long live Linux-like commands!)

rem collect arguments, spawn terminal for each one if it is a dir
:loopstart
if .%1==. goto none
if exist %1\* (
	goto spawn
) else (
	goto baddir
)

:spawn
start "myCMD" /D %1 C:\tools\myCMD\startup.bat
shift
if .%1==. goto loopend
goto :loopstart

:none
start "myCMD" C:\tools\myCMD\startup.bat

:baddir
if not .%1==. echo '%1' is not a valid directory
shift
if .%1==. goto loopend
goto :loopstart

:loopend

