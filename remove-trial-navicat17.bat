@echo off
setlocal enabledelayedexpansion

echo Deleting HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration17XEN...

reg delete "HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration17XEN" /f

echo.

echo Deleting parent folders of keys ending with \Info under HKEY_CURRENT_USER\Software\Classes\CLSID...

for /f "tokens=*" %%i in ('REG QUERY "HKEY_CURRENT_USER\Software\Classes\CLSID" /s ^| findstr /I "\\Info$"') do (
    set "key=%%i"
    set "parent=!key:~0,-5!"
    echo Deleting !parent!
    reg delete "!parent!" /f
)

echo.

echo Finished

pause
