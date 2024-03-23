echo Changing Directory...
cd C:\VAULT
rem system file directory changes a lot. Default for system and DOS Mode is C:\VAULT and C:\, but in things like files and management, files are in C:\VAULT
rem File table:
rem System: C:\VAULT
rem DOS: C:\
rem Games: C:\VAULT\Games
rem Apps: C:\VAULT\Applications
rem Drivers & Kernel: C:\VAULT\128\x86\Kernel(\Drivers)

title COMMAND/128.EXE
@echo off
setlocal enabledelayedexpansion
verify ON
set TITLE=COMMAND/128.EXE
set DOSVER=1.0
set PC_MS=1.0
set VER=0.1

:start
cls
echo                                 VAULT-DOS/128
echo                               VAULT-DOS 0.0.1.0
echo                           ------------------------
echo                            COPYRIGHT VAULT-INK (TM)
echo.
echo                    ["Most advanced Gaming OS, Simplified"]
echo.
echo    [Type "BOOT" or "HELP" to initialize Boot or learn about Boot Settings]
echo.
echo [DEVELOPER: %cd%]
:bootsetup
set /p GENERIC=">"
if /I "%GENERIC%"=="BOOT" goto boot
if /I "%GENERIC%"=="HELP" goto help
if /I "%GENERIC%"=="MAINT" goto Maintenance
if /I "%GENERIC%"=="Maintenance" goto CORRECT1
if /I "%GENERIC%"==OSMAN" goto OS_Manager
if /I "%GENERIC%"=="DOS" goto DOS
if /I "%GENERIC%"=="KMCN2823" goto DEV

:CORRECT1
echo [Invalid Syntax - "Maintenance"]
echo [Correct Syntax - "MAINT"]
goto bootsetup

:InvalidAnswer1
echo [ERROR - NO BOOT FILE FOUND FOR "%GENERIC%"]
pause >nul
goto bootsetup

:boot
echo VaultDOS/128 
echo.
echo VaultDOS/128 will now boot...
goto bootstr1

:help
rem SECRET is KMCN2823. It opens a special Developer version
rem Later on, [SECRET] will be entirely removed
echo [COMMAND]    [FUNCTION]                    [USAGE]
echo ==================================================
echo.
echo BOOT       Boots with Standard Settings     Boot
echo HELP       Opens Help Context Menu          Help
echo MAINT      Opens Maintenance Mode           Maintenance
echo OSMAN      Opens OS Manager                 OS Changer
echo DOS        Runs DOS.BAT Only Mode           PC/MS-DOS [DOS Mode currently does not work]
echo [SECRET]   [ERROR - ITEM UNAVAILABLE]       DEV ONLY
goto bootsetup











:bootstr1
cls
echo Welcome to Vault-DOS.
echo.
type README.TXT
echo Do you accept these terms?
echo  [1. YES] [2. NO]
echo {2 Will exit VaulDOS/128}
pause >nul










:DOS

:DOSMODE
cls
echo [Please wait while COMMAND/128.EXE manages Rogue Files...]
cd C:\
goto Verify

:Verify
echo [Would you like to:]
echo [ENABLE VERIFICATION (1.)]
echo [DISABLE VERFICATION (2.)]
echo [HELP ME (3.)]
set /p VFY=">"
if "%VFY%"=="1" (
    VERIFY ON
    goto DOSSTART
)
if "%VFY%"=="2" (
    VERIFY OFF
    goto DOSSTART
)
if "%VFY%"=="3" goto HELP_VFY

goto DOSSTART


:HELP_VFY
echo [VERIFY FUNCTION]
echo Verify will scan files for corruption or tampering.
echo This is enabled by default.
echo PC/MS-DOS mode does not require Verify to be on.
echo By disabling it, you can have faster file processing and improve performance.
echo By enabling it, you can have better file security.
goto Verify

:DOSSTART
cls
echo VAULT-DOS/128
echo   PC/MS-DOS Legacy Terminal Mode
echo.
echo [DOS MODE: %DOSVER%]
echo [PC/MS Compatibility: %PC_MS%]
echo [VAULT: %VER%]
echo.

:prompt
set /p command="%cd%> "
if /I "%command%"=="EXIT" goto DOSEXIT
%command%
goto prompt

:DOSEXIT
cls
echo [Please wait while COMMAND/128.EXE enables rogue files...]
setlocal enabledelayedexpansion
Verify ON
cd C:\VAULT
echo Complete.
echo [Press any key to reboot]
pause >nul
goto start
