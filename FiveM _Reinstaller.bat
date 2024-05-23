@echo off
setlocal

echo Copyright by RiCI
echo Wollen Sie FiveM wirklich neu installieren? Dadurch gehen Ihre FiveM Daten verloren. Moechten Sie fortfahren? (J/N)
set /p choice=

if /I not "%choice%"=="J" (
    echo Abgebrochen.
    exit /b
)

set fivem_dir=%localappdata%\FiveM
if exist "%fivem_dir%" (
    rd /s /q "%fivem_dir%"
    echo Der FiveM Ordner wurde erfolgreich gelöscht.
) else (
    echo Der FiveM Ordner wurde nicht gefunden.
)

set download_dir=%userprofile%\Downloads
set fivem_exe=%download_dir%\FiveM.exe
set fivem_url=https://runtime.fivem.net/client/FiveM.exe

if not exist "%fivem_exe%" (
    echo FiveM.exe wird heruntergeladen...
    powershell -Command "Invoke-WebRequest -Uri %fivem_url% -OutFile %fivem_exe%"
    if %ERRORLEVEL% neq 0 (
        echo Fehler beim Herunterladen von FiveM.exe
        exit /b
    )
    echo Download abgeschlossen.
)

echo FiveM wird installiert...
start "" "%fivem_exe%"

endlocal
