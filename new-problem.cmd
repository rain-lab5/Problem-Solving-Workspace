@echo off
setlocal

set "SCRIPT_DIR=%~dp0"

where powershell.exe >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    powershell.exe -ExecutionPolicy Bypass -File "%SCRIPT_DIR%scripts\new-problem.ps1" %*
    exit /b %ERRORLEVEL%
)

if exist "%SCRIPT_DIR%scripts\new-problem.sh" (
    bash.exe "%SCRIPT_DIR%scripts\new-problem.sh" %*
    exit /b %ERRORLEVEL%
)

echo Error: no supported script found for this environment.
exit /b 1
