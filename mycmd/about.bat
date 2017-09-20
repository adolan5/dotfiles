@echo off

if exist "keypress.exe" goto loopstart
echo Missing keypress.exe^! Do you need to download it off of the repository?
goto eof

rem Outputs a neat little 'about' message
:loopstart
cls
echo       ##     ##  ##    ##   ######   ##     ##  ########
echo       ###   ###   ##  ##   ##    ##  ###   ###  ##     ##
echo       #### ####    ####    ##        #### ####  ##     ##
echo       ## ### ##     ##     ##        ## ### ##  ##     ##
echo       ##  #  ##     ##     ##        ##  #  ##  ##     ##
echo       ##     ##     ##     ##    ##  ##     ##  ##     ##
echo       ##     ##     ##      ######   ##     ##  ########
echo                   A better way to cmd.
echo             www.github.com/adolan5/dotfiles
echo Press any key to exit...
keypress.exe
if %errorlevel%==1 goto eof
cls
echo       ##     ##  ##    ##   ######   ##     ##  ########
echo       #*#   #*#   #*  #*   *#    *#  #*#   #*#  *#     *#
echo       #### ####    ####    ##        #### ####  ##     ##
echo   *   ## ### ##     ##     ##        ## ### ##  ##     ##   *
echo       ##  #  ##     ##     ##        ##  #  ##  ##     ##
echo       ##     ##     ##     ##    ##  ##     ##  ##     ##
echo       ##     ##     ##      ######   ##     ##  ########
echo                   A better way to cmd.
echo             www.github.com/adolan5/dotfiles
echo Press any key to exit...
keypress.exe
if %errorlevel%==1 goto eof
cls
echo       ##     ##  ##    ##   ######   ##     ##  ########
echo       ###   ###   ##  ##   ##    ##  ###   ###  ##     ##
echo   ,   #### ####    ####    ##        #### ####  ##     ##   ,
echo  ;*;  ## ### ##     ##     ##        ## ### ##  ##     ##  ;*;
echo   `   #*  *  *#     #*     *#        #*  *  *#  #*     *#   `
echo       ##     ##     ##     ##    ##  ##     ##  ##     ##
echo       ##     ##     ##      ######   ##     ##  ########
echo                   A better way to cmd.
echo             www.github.com/adolan5/dotfiles
echo Press any key to exit...
keypress.exe
if %errorlevel%==1 goto eof
cls
echo       ##     ##  ##    ##   ######   ##     ##  ########
echo ' , ' ###   ###   ##  ##   ##    ##  ###   ###  ##     ## ' , '
echo       #### ####    ####    ##        #### ####  ##     ##
echo ;   ; ## ### ##     ##     ##        ## ### ##  ##     ## ;   ;
echo       ##  #  ##     ##     ##        ##  #  ##  ##     ##
echo ' ` ' ##     ##     ##     ##    ##  ##     ##  ##     ## ' ` '
echo       #*     *#     #*      #*##*#   #*     *#  #*##*##*
echo                   A better way to cmd.
echo             www.github.com/adolan5/dotfiles
echo Press any key to exit...
keypress.exe
if %errorlevel%==1 goto eof
goto loopstart

:eof
