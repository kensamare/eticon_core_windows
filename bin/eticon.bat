@ECHO off

SETLOCAL ENABLEDELAYEDEXPANSION

FOR %%i IN ("%~dp0..") DO SET ETICON_ROOT=%%~fi

REM ECHO PATH: %ETICON_ROOT%
REM ECHO LOC: %cd%
IF -%1==-open (GOTO open)
If -%1==-version (GOTO ver)
If -%1==-update (GOTO upd)
ECHO.
ECHO Available commands:
ECHO.
ECHO    1. open - Open the graphical interface
ECHO    2. version - Show version of Eticon utils
GOTO EXIT
:open
echo OPEN
start %ETICON_ROOT%\Core\"ETICON Core.exe" %cd%
GOTO EXIT
:not_found
echo Eticon Error: Command not found
GOTO EXIT
:ver
echo Eticon Core v1.0.0-windows
GOTO EXIT
:upd
cd %ETICON_ROOT%
git pull --rebase
GOTO EXIT
:EXIT
