@echo off
sc query NetTimeSvc >nul 2>&1
if %errorlevel% equ 0 (
    echo O serviço NetTimeSvc existe.
    sc query NetTimeSvc | findstr /i "RUNNING" >nul
    if %errorlevel% equ 0 (
        echo O serviço NetTimeSvc já está em execução.
        exit /b 0
    ) else (
        echo O serviço NetTimeSvc está parado. Iniciando...
        net start NetTimeSvc
        exit /b 0
    )
) else (
    echo O serviço NetTimeSvc não existe. Continuando com a instalação...
)

curl -o "%TEMP%\NetTimeSetup.exe" https://www.timesynctool.com/NetTimeSetup-314.exe
"%TEMP%\NetTimeSetup.exe" /SILENT

echo [TimeServers]> "C:\Program Files (x86)\NetTime\NetTime.ini"
echo Server1=a.ntp.br >> "C:\Program Files (x86)\NetTime\NetTime.ini"
echo Server2=b.ntp.br >> "C:\Program Files (x86)\NetTime\NetTime.ini"
echo Server3=c.ntp.br >> "C:\Program Files (x86)\NetTime\NetTime.ini"
echo Server4=pool.ntp.br >> "C:\Program Files (x86)\NetTime\NetTime.ini"

sc config NetTimeSvc start= auto
cd "C:\Program Files (x86)\NetTime"
taskkill /im NetTime.exe /f >nul 2>&1
del "NetTime.exe" >nul 2>&1

net stop NetTimeSvc >nul 2>&1
net start NetTimeSvc
