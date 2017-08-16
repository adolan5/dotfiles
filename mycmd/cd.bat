@echo off
rem Behaves more like linux 'cd'

rem collect argument (if there is one)
if .%1==. goto none

:change
cd %1
goto end

rem if there was no argument, cd into the user's home dir
:none
cd %USERPROFILE%
goto end

:end
