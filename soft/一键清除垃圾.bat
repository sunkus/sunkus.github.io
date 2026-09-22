@echo off
title 一键清除垃圾增强版
color 2f
echo 正在检查cookies、历史纪录等目录位置(当前用户)……
reg query "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Cache>%temp%\cleantmp.txt
reg query "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Cookies>>%temp%\cleantmp.txt
reg query "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v History>>%temp%\cleantmp.txt
reg query "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v NetHood>>%temp%\cleantmp.txt
reg query "HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Recent>>%temp%\cleantmp.txt
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\Folder" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.rar" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.mp3" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.jpg" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.ini" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.bmp" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.doc" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.eip" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.htm" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.ico" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.inf" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.gif" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.wav" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.xls" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.rm" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\*" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\mp3" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\rm" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\wav" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\bat" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\exe" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\eip" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\ico" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\htm" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\jpg" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{5E6AB780-7743-11CF-A12B-00AA004AE837}\Count" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{75048700-EF1F-11D0-9888-006097DEACF9}\Count" /va /f >nul 2>nul
reg delete "HKCU\Software\WinRAR\ArcHistory" /va /f >nul 2>nul
reg delete "HKCU\Software\WinRAR\DialogEditHistory\ArcName" /va /f >nul 2>nul
reg delete "HKCU\Software\WinRAR\DialogEditHistory\ExtrPath" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentFileList" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Microsoft Management Console\Recent File List" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Office\11.0\PowerPoint\Recent File List" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Office\11.0\Excel\Recent File" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Office\11.0\Word\Data" /v "Settings" /f >nul 2>nul
reg delete "HKCU\Software\VMware, Inc." /va /f >nul 2>nul 
echo 正在清理Cookies、IE缓存、历史纪录等(当前用户)……
for /f "tokens=3*" %%a in (%temp%\cleantmp.txt) do (
for /d %%i in ("%%a %%b\*.*") do rd /s /q "%%i"
del /a /f /s /q "%%a %%b\*.*"
)
::跟上面几项未必是重复的(！)，也是对当前用户目录
echo 正在清理临时文件 (系统目录)……
del /a /f /s /q "%userprofile%\Locals~1\Tempor~1\*.*" 
del /a /f /s /q "%userprofile%\Locals~1\Temp\*.*" 
del /a /f /s /q "%userprofile%\cookies\*.*" 
del /a /f /s /q "%userprofile%\recent\*.*"
del /a /f /s /q "%Temp%\*.*"
del /a /f /s /q "%Tmp%\*.*"
del /a /f /s /q "%HomePath%\..\IconCache.db"
echo 正在清理系统目录中的垃圾文件 (稍候，需要点时间)……
del /a /f /s /q "%systemdrive%\*._mp"
del /a /f /s /q "%systemdrive%\*.log"
del /a /f /s /q "%systemdrive%\*.dmp"
del /a /f /s /q "%systemdrive%\*.gid"
del /a /f /s /q "%systemdrive%\*.old"
del /a /f /s /q "%systemdrive%\*.tmp"
del /a /f /s /q "%systemdrive%\recycled\*.*"
del /a /f /s /q "%SystemRoot%\*.bak"
del /a /f /s /q "%SystemRoot%\*.query"
rd /s /q "%SystemRoot%\Downloaded Program Files"
rd /s /q "%SystemRoot%\Offline Web Pages"
rd /s /q "%systemroot%\Connection Wizard"
rd /s /q "%SystemRoot%\SoftwareDistribution\Download"
rd /s /q "%SystemRoot%\Help"
rd /s /q "%SystemRoot%\system32\ReinstallBackups"
del /a /s /q "%SystemRoot%\inf\*.pnf"
del /a /f /s /q "%SystemRoot%\inf\InfCache.1"
dir %SystemRoot%\inf\*.* /ad/b >%SystemRoot%\vTmp.txt
for /f %%a in (%SystemRoot%\vTmp.txt) do rd /s /q "%SystemRoot%\inf\%%a"
del /a /f /s /q "%SystemRoot%\Driver Cache\*.pnf"
del /a /f /s /q "%SystemRoot%\Driver Cache\InfCache.1" 
del /a /f /s /q "%SystemRoot%\system32\drivers\*.pnf"
del /a /f /s /q "%SystemRoot%\system32\drivers\InfCache.1"
rd /s /q "%SystemRoot%\temp" & md "%SystemRoot%\temp"
del /a /f /s /q "%SystemRoot%\Prefetch\*.*"
del /a /f /s /q "%SystemRoot%\minidump\*.*"
echo 正在清除无用的磁盘检错文件 (系统分区)……
del /a /f /q "%SystemDrive%\*.chk"
dir %SystemDrive%\found.??? /ad/b >%SystemRoot%\vTmp.txt
for /f %%a in (%SystemRoot%\vTmp.txt) do rd /s /q "%SystemDrive%\%%a"
echo 正在清理系统升级补丁留下来的反安装目录 (已修正能正确清除)……
dir %SystemRoot%\$*$ /ad/b >%SystemRoot%\vTmp.txt
for /f %%a in (%SystemRoot%\vTmp.txt) do rd /s /q "%SystemRoot%\%%a"
echo 正在清除常见的软件垃圾项目 (按默认目录)……
rd /s /q "%ProgramFiles%\InstallShield Installation Information"
Ren "%ProgramFiles%\Common~1\Real\Update_OB\realsched.exe" realsched.ex_
Del "%ProgramFiles%\Common~1\Real\Update_OB\realsched.exe"
Reg Delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v TkBellExe /f
rd /s /q "%ProgramFiles%\Tencent\QQGame\Download"
taskkill /f /im "TIMPlatform.exe" /t
del /a /f /s /q "%ProgramFiles%\Kaspersky Lab\*.tmp"
del %SystemRoot%\vTmp.txt
del /f /s /q C:\Windows\System32\spool\PRINTERS\*.*