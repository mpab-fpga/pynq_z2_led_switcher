@echo off

call :REMOVE .\firmware
mkdir .\firmware
echo "" > .\firmware\.keep

call :REMOVE .\fpga
mkdir .\fpga
echo "" > .\fpga\.keep

goto :eof

:REMOVE
if exist %~1 rd /S /Q %~1 > nul 2>&1
if exist %~1 del %~1 > nul 2>&1
goto :eof
