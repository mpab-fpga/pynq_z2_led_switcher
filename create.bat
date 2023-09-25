@echo off
where /q vivado.bat || echo "ERROR: missing vivado.bat - install the Xilinx toolchain" && exit /B
where /q xsct.bat || echo "ERROR: missing xsct.bat - install the Xilinx toolchain" && exit /B

call :EXIT_IF_EXISTS .\fpga\fpga.gen
call :EXIT_IF_EXISTS .\fpga\fpga.hw
call :EXIT_IF_EXISTS .\fpga\fpga.srcs

call :EXIT_IF_EXISTS .\firmware\pynq_z2_pfm
call :EXIT_IF_EXISTS .\firmware\led_switcher_app
call :EXIT_IF_EXISTS .\firmware\led_switcher_app_system

:HARDWARE
rd /S /Q gen > nul 2>&1
mkdir gen
pushd gen
call vivado -mode batch -nojournal -source ../create-fpga.tcl -tclargs --origin_dir ../assets/
popd

robocopy .\gen\fpga .\fpga /S /MOV
rd /S /Q gen > nul 2>&1

pushd fpga
call vivado -mode batch -nojournal -source ../generate-xsa.tcl
popd

:FIRMWARE
pushd firmware
call xsct.bat ..\create-firmware.tcl
popd

goto :EOF

:EXIT_IF_EXISTS
if exist  %~1 (
    echo WARNING: found %~1 - run clean.bat?
    (goto) 2>nul & endlocal & exit /b %ERRORLEVEL%
)
goto :EOF
