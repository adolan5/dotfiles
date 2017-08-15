@echo off
rem Behaves more like linux 'cd'

rem collect argument (if there is one)
if .%1==. goto none
if exist %1\* (
	goto change
) else (
	goto baddir
)

:none
cd %USERPROFILE%
goto end

:baddir
if not .%1==. echo '%1' is not a valid directory
goto end

:change
rem (ber) TODO this part!
goto end

:end
