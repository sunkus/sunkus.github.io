chcp 936
@echo off
rem %%i为第1字段 %j为第2字段 %k为第3字段，请根据需要修改获取的变量
for /F "tokens=3" %%i in ( 'REG QUERY HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HLL_Web_Service /s ^| findstr "ImagePath"' ) do ( set commitid=%%i)
rem echo %commitid:~0,-17%
cd /d %commitid:~0,-17%jre\bin
keytool.exe -import -alias hualala01 -keystore ../lib/security/cacerts -file %~dp0\hualala.cer -trustcacerts -storepass changeit

cd /d %commitid:~0,-17%jre64\bin
keytool.exe -import -alias hualala01 -keystore ../lib/security/cacerts -file %~dp0\hualala.cer -trustcacerts -storepass changeit

pause