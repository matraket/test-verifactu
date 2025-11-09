@echo off
REM ============================================
REM Script de Suministro - Ejemplo Simple
REM Se ejecuta cada minuto por la tarea programada
REM ============================================

REM Obtener directorio del script
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

REM Crear carpeta de logs si no existe
if not exist "%SCRIPT_DIR%logs" mkdir "%SCRIPT_DIR%logs"

REM Archivo de log con fecha
set LOG_FILE=%SCRIPT_DIR%logs\suministro.log

REM Obtener fecha y hora en formato dd/mm/YYYY HH:MM:SS
for /f "tokens=1-3 delims=/ " %%a in ("%date%") do (
    set DIA=%%a
    set MES=%%b
    set ANIO=%%c
)
set HORA=%time:~0,8%

REM Escribir en el log
echo Test de suministro realizado a las %DIA%/%MES%/%ANIO% %HORA% >> "%LOG_FILE%"

exit /b 0
