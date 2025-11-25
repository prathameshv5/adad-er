@echo off
echo Exporting Mermaid ER Diagram to PNG...

REM Check if Mermaid CLI is installed
where mmdc >nul 2>nul
if %errorlevel% neq 0 (
    echo Mermaid CLI not found. Installing...
    npm install -g @mermaid-js/mermaid-cli
)

REM Export to PNG with high resolution
mmdc -i er-diagram.mmd -o er-diagram.png -w 3000 -H 2000 --backgroundColor white

if %errorlevel% equ 0 (
    echo Successfully exported to er-diagram.png
) else (
    echo Export failed. Make sure Node.js and npm are installed.
    echo Run: npm install -g @mermaid-js/mermaid-cli
)

pause