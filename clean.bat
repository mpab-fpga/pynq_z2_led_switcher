@echo off

call :REMOVE .\firmware
mkdir .\firmware
touch .\firmware\.keep

call :REMOVE .\fpga
mkdir .\fpga
touch .\fpga\.keep

goto :EOF

:REMOVE
if exist %~1 rd /S /Q %~1 > nul 2>&1
if exist %~1 del %~1 > nul 2>&1
goto :EOF
