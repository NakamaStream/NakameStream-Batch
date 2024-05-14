@echo off
cls
echo -----------------------------------------
echo      Welcome to the Interactive Menu NakamaStream
echo -----------------------------------------
echo/
echo 1. [ Repository ]
echo 2. [ Extra ]
echo 3. [ Exit ]
echo -----------------------------------------
set /p choice=Select an option: 

if "%choice%"=="1" goto repository
if "%choice%"=="2" goto extra
if "%choice%"=="3" goto :eof

echo Invalid option. Please select a valid option.
pause
goto :menu

:repository
cls
echo -----------------------------------------
echo      Select a Repository to Download
echo -----------------------------------------
echo/
echo 1. [ NakamaStream ]
echo 2. [ NakamaStream-Android ]
echo 3. [ NakamaStream-Batch ]
echo 4. [ Back to Main Menu ]
echo -----------------------------------------
set /p repo_choice=Select a repository: 

if "%repo_choice%"=="1" (
    set repo=NakamaStream
    goto select_location
)

if "%repo_choice%"=="2" (
    set repo=NakamaStream-Android
    goto select_location
)

if "%repo_choice%"=="3" (
    set repo=NakamaStream-Batch
    goto select_location
)

if "%repo_choice%"=="4" goto :menu

echo Invalid option. Please select a valid option.
pause
goto :repository

:select_location
cls
echo -----------------------------------------
echo     Select the download location
echo -----------------------------------------
echo/
echo 1. [ Desktop ]
echo 2. [ Downloads ]
echo 3. [ Custom Path ]
echo -----------------------------------------
set /p location_choice=Select a location: 

if "%location_choice%"=="1" (
    set "download_path=%USERPROFILE%\Desktop"
)

if "%location_choice%"=="2" (
    set "download_path=%USERPROFILE%\Downloads"
)

if "%location_choice%"=="3" (
    set /p "download_path=Enter custom path (e.g., C:\path\to\folder): "
)

if "%location_choice%"=="3" (
    if not exist "%download_path%" (
        echo Invalid path. Please select a valid path.
        pause
        goto :select_location
    )
)

goto download

:download
cls
echo Downloading %repo%...
echo/
echo [..        ]
timeout /t 1 /nobreak >nul
cls
echo Downloading %repo%...
echo/
echo [..\       ]
timeout /t 1 /nobreak >nul
cls
echo Downloading %repo%...
echo/
echo [...\      ]
timeout /t 1 /nobreak >nul
cls
echo Downloading %repo%...
echo/
echo [...\     ]
timeout /t 1 /nobreak >nul
cls
echo Downloading %repo%...
echo/
echo [....\    ]
timeout /t 1 /nobreak >nul
cls
echo Downloading %repo%...
echo/
echo [.....\   ]
timeout /t 1 /nobreak >nul
cls
echo Downloading %repo%...
echo/
echo [......\  ]
timeout /t 1 /nobreak >nul
cls
echo Downloading %repo%...
echo/
echo [.......\ ]
timeout /t 1 /nobreak >nul
cls
echo Downloading %repo%....
echo/
echo [........]
timeout /t 1 /nobreak >nul

curl -s -L https://github.com/NakamaStream/%repo%/archive/refs/heads/master.zip -o "%download_path%\%repo%.zip"

if %errorlevel% neq 0 (
    echo Failed to download %repo%.
    pause
    goto :menu
) else (
    echo %repo% downloaded successfully.
    pause
    goto :menu
)

:extra
cls
echo -----------------------------------------
echo               Credits
echo -----------------------------------------
echo This project is being developed by:
echo - staFF6773
echo - Cristofer543
echo - SantiagolxxGG
echo -----------------------------------------
echo Sponsored by SstudiosDev Programming Studio.
echo/
echo Special Thanks to:
echo - akit for their contributions.
echo -----------------------------------------
echo For more information, visit our website at:
echo https://github.com/NakamaStream
echo -----------------------------------------
pause
goto :menu

:eof
echo Exiting...
pause
