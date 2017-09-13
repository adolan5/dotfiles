@echo off
rem This script configures your myCMD environment. It is called when you run myCMD

rem Linux dupes
doskey clear=cls
doskey ls=dir

rem cd into home (starting) dir
doskey home=cd "%USERPROFILE%"

rem The location of your notepad++ installation/executable
set NPP_EXE_DIR=C:\Program Files (x86)\Notepad++
rem The location of your gimp 2.8 installation/executable
set GIMP_EXE_DIR=C:\Program Files\GIMP 2\bin

rem Example of an 'alias'
rem doskey p=path\to\putty.exe
