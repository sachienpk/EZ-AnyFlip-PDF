@echo off
setlocal enabledelayedexpansion

:: 1. Setup
echo ===========================================
echo        AnyFlip to PDF Downloader (V2)
echo ===========================================
echo.

set /p "userlink=Paste AnyFlip Link: "
set /p "pdfname=Name for your PDF: "

:: Get the absolute path of the current folder
set "rootdir=%~dp0"
set "tempdir=%rootdir%temp_anyflip_pages"

:: Clean link
set "id_path=%userlink:https://anyflip.com/=%"
set "id_path=%id_path:/basic=%"
set "id_path=%id_path:anyflip.com/=%"

if exist "%tempdir%" rd /s /q "%tempdir%"
mkdir "%tempdir%"
cd /d "%tempdir%"

echo.
echo Downloading images to: %tempdir%
echo.

:: 2. Download Loop
set /a count=1
:download_loop
set "target_url=https://online.anyflip.com/%id_path%/files/mobile/!count!.webp"
curl -f "%target_url%" -o "!count!.webp" --silent

if %errorlevel% neq 0 (
    set /a final_count=!count! - 1
    goto :compile
) else (
    echo [^+] Page !count! fetched...
    set /a count+=1
    goto :download_loop
)

:compile
echo.
if !final_count! equ 0 (
    echo [!] No pages were downloaded. Check your link!
    pause
    exit
)

echo Success: !final_count! pages found.
echo Compiling PDF...

:: 3. Create HTML with absolute image references
(
echo ^<html^>^<body style="margin:0;padding:0;"^>
for /l %%i in (1,1,%final_count%) do (
    echo ^<img src="file:///%tempdir:\=/%/%%i.webp" style="width:100%%;display:block;page-break-after:always;"^>
)
echo ^</body^>^</html^>
) > index.html

:: 4. Convert using Absolute Paths
powershell -Command "Start-Process -FilePath 'msedge' -ArgumentList '--headless', '--disable-gpu', '--print-to-pdf=\"%rootdir%%pdfname%.pdf\"', '--no-pdf-header-footer', 'file:///%tempdir:\=/%/index.html' -Wait"

:: 5. Cleanup
echo.
echo Cleaning up temporary files...
cd /d "%rootdir%"
rd /s /q "%tempdir%"

echo ===========================================
echo DONE! File saved as: %pdfname%.pdf
echo ===========================================
pause