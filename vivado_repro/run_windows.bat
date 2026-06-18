@echo off
setlocal EnableExtensions

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "REPO_ROOT=%%~fI"

set "VIVADO_EXE=%VIVADO%"
if "%VIVADO_EXE%"=="" set "VIVADO_EXE=vivado"

set "PART=xczu9eg-ffvb1156-2"
set "PERIOD=6.667"
set "MODE=impl"
set "TOP=pulpino"
set "OUT_DIR=vivado_repro/out"

:parse_args
if "%~1"=="" goto check_vivado
if /I "%~1"=="-vivado" (
  set "VIVADO_EXE=%~2"
  shift
  shift
  goto parse_args
)
if /I "%~1"=="-part" (
  set "PART=%~2"
  shift
  shift
  goto parse_args
)
if /I "%~1"=="-period" (
  set "PERIOD=%~2"
  shift
  shift
  goto parse_args
)
if /I "%~1"=="-mode" (
  set "MODE=%~2"
  shift
  shift
  goto parse_args
)
if /I "%~1"=="-top" (
  set "TOP=%~2"
  shift
  shift
  goto parse_args
)
if /I "%~1"=="-out_dir" (
  set "OUT_DIR=%~2"
  shift
  shift
  goto parse_args
)
echo ERROR: Unknown argument %~1
echo Usage: vivado_repro\run_windows.bat [-vivado path\to\vivado.bat] [-part part] [-period ns] [-mode synth^|impl] [-top module] [-out_dir dir]
exit /b 1

:check_vivado
if exist "%VIVADO_EXE%" goto run_vivado
where "%VIVADO_EXE%" >nul 2>nul
if errorlevel 1 (
  echo ERROR: Vivado was not found in PATH.
  echo Pass -vivado "C:\Xilinx\Vivado\2020.2\bin\vivado.bat" or set the VIVADO environment variable.
  exit /b 1
)

:run_vivado
pushd "%REPO_ROOT%" >nul
if exist "%VIVADO_EXE%" (
  call "%VIVADO_EXE%" -mode batch -source "%SCRIPT_DIR%run_pulpino_150mhz.tcl" -tclargs -part "%PART%" -period "%PERIOD%" -mode "%MODE%" -top "%TOP%" -out_dir "%OUT_DIR%"
) else (
  call %VIVADO_EXE% -mode batch -source "%SCRIPT_DIR%run_pulpino_150mhz.tcl" -tclargs -part "%PART%" -period "%PERIOD%" -mode "%MODE%" -top "%TOP%" -out_dir "%OUT_DIR%"
)
set "RC=%ERRORLEVEL%"
popd >nul
exit /b %RC%
