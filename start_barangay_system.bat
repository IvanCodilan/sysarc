@echo off
cd /d "C:\Users\Laptop Supplier PH\Documents\sysarc"
REM Check if MySQL (XAMPP) is running by looking for mysqld.exe
tasklist /FI "IMAGENAME eq mysqld.exe" | find /I "mysqld.exe" >nul
if errorlevel 1 (
    echo MySQL / XAMPP is not running. Please start XAMPP first.
    pause
    exit /b
)
start "" wscript.exe "C:\Users\Laptop Supplier PH\Documents\sysarc\run_hidden.vbs"
start "" http://127.0.0.1:8000