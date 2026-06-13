@echo off
echo ============================================
echo   AI Interview System - Setup
echo ============================================
echo.
echo Step 1: Creating virtual environment...
python -m venv venv
if errorlevel 1 (
    echo ERROR: Python not found. Install from https://python.org
    pause
    exit /b 1
)

echo Step 2: Activating virtual environment...
call venv\Scripts\activate

echo Step 3: Installing dependencies...
pip install flask

echo.
echo ============================================
echo   Setup complete! Run: start.bat
echo ============================================
pause
