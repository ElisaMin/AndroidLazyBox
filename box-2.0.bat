@echo on
set rf=%~dp0
title ���˹��ߺ�
mode con cols=80 lines=30
color f0
set number=%random%%random%%random%%random%
:start
if exist %rf%lgup.off goto home
if exist %rf%lgup.on goto start-lgup-checks
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo �ƽ�LGUPֻ����һ�Σ���������ٴ��ƽ�lgup����ɾ�����ļ����µġ�lgup.off���ļ���
echo -------------------------------------------------------------------------------
echo.
echo.
echo       1. �ƽ�LGUP	^|	ʹ�ø�ѡ����رսű����Թ���������
echo.
echo       2. ����		^|	��ˢ��boot��GSI��һ�����á��л�ab������
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ��" /c 12
echo powerbyheizi>lgup.off
if %errorlevel%==1 goto start-lgup-check
if %errorlevel%==2 goto home
goto end
goto end-wrong
:start-lgup-check
del %rf%lgup.off
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo -------------------------------------------------------------------------------
echo �����������ԱȨ��...
echo -------------------------------------------------------------------------------
echo ���ű��޸���https://forum.xda-developers.com/android/general/tecknights-aristo-2-tutorials-t3805141/page3
echo -------------------------------------------------------------------------------
echo powerbyheizi>%rf%lgup.on
goto UACPrompt
) else ( goto start-lgup-checks )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:start-lgup-checks
del %rf%lgup.on
echo ���LGUP��װ״̬�С���
echo -------------------------------------------------------------------------------
if exist "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe" (
echo �ɹ�
echo -------------------------------------------------------------------------------
goto start-lgup-checkses
) else (
rem ���У���������һ��ҪȥGitub���Ҹ��ˣ�л�ˡ�����ִ�д����Ұ����Ŷ�ɾ�ˣ��ĳ����ͷ����档
  rem echo ʧ��
  rem echo -------------------------------------------------------------------------------
  rem echo ���¶�����
  rem echo -------------------------------------------------------------------------------
  rem set "ProgramFiles��x86��"="C:\Program Files ��x86��"
	  rem echo " %ProgramFiles��x86��%\LG Electronics\LGUP\LGUP.exe "
      rem if exist "%ProgramFiles��x86��%\LG Electronics\LGUP\LGUP.exe" ��A
	  rem echo "%ProgramFiles��x86��\LG Electronics\LGUP\LGUP.exe"
      rem echo ����ɹ�
      rem echo -------------------------------------------------------------------------------
      rem goto start-lgup-checkses
      rem ��A else ��B
        echo ������δ��⵽LGUP��������ת������ҳ�桭��
        echo -------------------------------------------------------------------------------
        %rf%file\other\help.url
        goto lgup-end-error
		rem ��B 
)
:start-lgup-checkses
echo ���LGUP����״̬�С���
echo -------------------------------------------------------------------------------
if exist "%rf%file\lgup\LGUPR.exe" (
echo ���ڣ�����Ϊ���������ݡ�
echo -------------------------------------------------------------------------------
goto start-lgup
) else (
echo �����ڣ�������
echo -------------------------------------------------------------------------------
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"  "%rf%file\lgup\LGUPR.exe"
if not errorlevel 1 goto start-lgup
echo �����󣡱���ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
:start-lgup
echo powerbyheizi>%rf%lgup.off
title ���˹��ߺ� - �ƽ�LGUP
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo       1. �ƽ�LGUP
echo.
echo.
echo.
echo       2. ��ԭLGUP
echo.
echo.
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ��" /c 12
if %errorlevel%==1 goto setdev
if %errorlevel%==2 goto setrec
:setdev
title ���˹��ߺ� - �ƽ�LGUP - �ƽ�ģʽ
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo ����Common�ļ��У����޸�DLL�С���
if not exist "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\" md "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if errorlevel 0 ( 
echo �������޸�ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
copy -Y "%rf%file\lgup\LGUP_CommonD.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
echo -------------------------------------------------------------------------------
echo �޸�LGUP�С���
copy "%rf%file\lgup\LGUPD.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if errorlevel 1 ( 
echo �������޸�ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo ���
echo -------------------------------------------------------------------------------
goto end
:setrec
title ���˹��ߺ� - �ƽ�LGUP - �ָ�ģʽ
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo ɾ��Common�ļ��С�DLL�С���
del "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
rd "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if errorlevel 1 ( 
echo �������޸�ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo �޸�LGUP�С���
copy "%rf%file\lgup\LGUPR.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if errorlevel 1 ( 
echo �������޸�ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo ���
echo -------------------------------------------------------------------------------
pause

:lgup-end-error
title ����
echo ����״̬��
if exist %rf%lgup.off del %rf%lgup.off
if exist %rf%lgup.on del %rf%lgup.on
echo -------------------------------------------------------------------------------

:lgup-end
set /p powerbyheizi=���������˳��ű�
goto edddddddddd
:home 
goto end
goto end-wrong

:end-wrong
set /p powerbyheizi=�����������
goto edddddddddd
:end
set /p powerbyheizi=ִ�����,�������������ҳ��
goto home