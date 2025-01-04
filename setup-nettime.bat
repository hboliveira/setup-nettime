@echo off
curl -o "%TEMP%\NetTimeSetup.exe" https://www.timesynctool.com/NetTimeSetup-314.exe
"%TEMP%\NetTimeSetup.exe" /SILENT
echo [TimeServers]> "C:\Program Files (x86)\NetTime\NetTime.ini"
echo Server1=a.ntp.br >> "C:\Program Files (x86)\NetTime\NetTime.ini"
echo Server2=b.ntp.br >> "C:\Program Files (x86)\NetTime\NetTime.ini"
echo Server3=c.ntp.br >> "C:\Program Files (x86)\NetTime\NetTime.ini"
echo Server4=pool.ntp.br >> "C:\Program Files (x86)\NetTime\NetTime.ini"
sc config NetTimeSvc start= auto
cd "C:\Program Files (x86)\NetTime"
taskkill /im NetTime.exe /f
del "NetTime.exe"
net stop NetTimeSvc
net start NetTimeSvc
