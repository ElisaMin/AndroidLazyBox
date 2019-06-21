@echo on
set rf=%~dp0
title 懒人工具盒
mode con cols=80 lines=30
color f0
set number=%random%%random%%random%%random%
:start
if exist %rf%lgup.off goto home
if exist %rf%lgup.on goto start-lgup-checks
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 破解LGUP只出现一次，如果还想再次破解lgup可以删除在文件夹下的“lgup.off”文件。
echo -------------------------------------------------------------------------------
echo.
echo.
echo       1. 破解LGUP	^|	使用该选项请关闭脚本后以管理者运行
echo.
echo       2. 其他		^|	可刷入boot和GSI、一键禁用、切换ab分区等
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择" /c 12
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
echo 正在请求管理员权限...
echo -------------------------------------------------------------------------------
echo 本脚本修改自https://forum.xda-developers.com/android/general/tecknights-aristo-2-tutorials-t3805141/page3
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
echo 检查LGUP安装状态中……
echo -------------------------------------------------------------------------------
if exist "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe" (
echo 成功
echo -------------------------------------------------------------------------------
goto start-lgup-checkses
) else (
rem 大佬，看到这里一定要去Gitub帮我改了，谢了。由于执行错误我把括号都删了，改成正和反代替。
  rem echo 失败
  rem echo -------------------------------------------------------------------------------
  rem echo 重新定向中
  rem echo -------------------------------------------------------------------------------
  rem set "ProgramFiles正x86反"="C:\Program Files 正x86反"
	  rem echo " %ProgramFiles正x86反%\LG Electronics\LGUP\LGUP.exe "
      rem if exist "%ProgramFiles正x86反%\LG Electronics\LGUP\LGUP.exe" 正A
	  rem echo "%ProgramFiles正x86反\LG Electronics\LGUP\LGUP.exe"
      rem echo 定向成功
      rem echo -------------------------------------------------------------------------------
      rem goto start-lgup-checkses
      rem 反A else 正B
        echo ！错误！未检测到LGUP！正在跳转至帮助页面……
        echo -------------------------------------------------------------------------------
        %rf%file\other\help.url
        goto lgup-end-error
		rem 反B 
)
:start-lgup-checkses
echo 检查LGUP备份状态中……
echo -------------------------------------------------------------------------------
if exist "%rf%file\lgup\LGUPR.exe" (
echo 存在，正在为您跳过备份。
echo -------------------------------------------------------------------------------
goto start-lgup
) else (
echo 不存在，备份中
echo -------------------------------------------------------------------------------
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"  "%rf%file\lgup\LGUPR.exe"
if not errorlevel 1 goto start-lgup
echo ！错误！备份失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
:start-lgup
echo powerbyheizi>%rf%lgup.off
title 懒人工具盒 - 破解LGUP
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo       1. 破解LGUP
echo.
echo.
echo.
echo       2. 还原LGUP
echo.
echo.
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "请选择" /c 12
if %errorlevel%==1 goto setdev
if %errorlevel%==2 goto setrec
:setdev
title 懒人工具盒 - 破解LGUP - 破解模式
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 创建Common文件夹，并修改DLL中……
if not exist "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\" md "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if errorlevel 0 ( 
echo ！错误！修改失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
copy -Y "%rf%file\lgup\LGUP_CommonD.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
echo -------------------------------------------------------------------------------
echo 修改LGUP中……
copy "%rf%file\lgup\LGUPD.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if errorlevel 1 ( 
echo ！错误！修改失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo 完成
echo -------------------------------------------------------------------------------
goto end
:setrec
title 懒人工具盒 - 破解LGUP - 恢复模式
cls
echo PowerBy-HEIZI 懒人工具盒 V2.0.%number% 
echo -------------------------------------------------------------------------------
echo 删除Common文件夹、DLL中……
del "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
rd "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if errorlevel 1 ( 
echo ！错误！修改失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo 修改LGUP中……
copy "%rf%file\lgup\LGUPR.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if errorlevel 1 ( 
echo ！错误！修改失败！正在跳转至帮助页面……
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo 完成
echo -------------------------------------------------------------------------------
pause

:lgup-end-error
title 错误！
echo 清理状态中
if exist %rf%lgup.off del %rf%lgup.off
if exist %rf%lgup.on del %rf%lgup.on
echo -------------------------------------------------------------------------------

:lgup-end
set /p powerbyheizi=点击任意键退出脚本
goto edddddddddd
:home 
goto end
goto end-wrong

:end-wrong
set /p powerbyheizi=你掉进了世界
goto edddddddddd
:end
set /p powerbyheizi=执行完成,按任意键返回主页。
goto home