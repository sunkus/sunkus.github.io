chcp 936
@echo off
rem %%iΪ��1�ֶ� %jΪ��2�ֶ� %kΪ��3�ֶΣ��������Ҫ�޸Ļ�ȡ�ı���
for /F "tokens=3" %%i in ( 'REG QUERY HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\HLL_Web_Service /s ^| findstr "ImagePath"' ) do ( set commitid=%%i)
rem echo %commitid:~0,-17%
cd /d %commitid:~0,-17%jre\bin
keytool.exe -import -alias hualala01 -keystore ../lib/security/cacerts -file %~dp0\hualala.cer -trustcacerts -storepass changeit

cd /d %commitid:~0,-17%jre64\bin
keytool.exe -import -alias hualala01 -keystore ../lib/security/cacerts -file %~dp0\hualala.cer -trustcacerts -storepass changeit

pause