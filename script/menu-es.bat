@echo off
cls
echo -----------------------------------------
echo      Bienvenido al Menú Interactivo NakamaStream
echo -----------------------------------------
echo/
echo 1. [ Repositorio ]
echo 2. [ Extra ]
echo 3. [ Salir ]
echo -----------------------------------------
set /p choice=Selecciona una opción: 

if "%choice%"=="1" goto repositorio
if "%choice%"=="2" goto extra
if "%choice%"=="3" goto :eof

echo Opción inválida. Por favor, selecciona una opción válida.
pause
goto :menu

:repositorio
cls
echo -----------------------------------------
echo      Selecciona un Repositorio para Descargar
echo -----------------------------------------
echo/
echo 1. [ NakamaStream ]
echo 2. [ NakamaStream-Android ]
echo 3. [ NakamaStream-Batch ]
echo 4. [ Volver al Menú Principal ]
echo -----------------------------------------
set /p repo_choice=Selecciona un repositorio: 

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

echo Opción inválida. Por favor, selecciona una opción válida.
pause
goto :repositorio

:select_location
cls
echo -----------------------------------------
echo     Selecciona la ubicación de descarga
echo -----------------------------------------
echo/
echo 1. [ Escritorio ]
echo 2. [ Descargas ]
echo 3. [ Ruta Personalizada ]
echo -----------------------------------------
set /p location_choice=Selecciona una ubicación: 

if "%location_choice%"=="1" (
    set "download_path=%USERPROFILE%\Desktop"
)

if "%location_choice%"=="2" (
    set "download_path=%USERPROFILE%\Downloads"
)

if "%location_choice%"=="3" (
    set /p "download_path=Ingresa la ruta personalizada (por ejemplo, C:\ruta\a\carpeta): "
)

if "%location_choice%"=="3" (
    if not exist "%download_path%" (
        echo Ruta inválida. Por favor, selecciona una ruta válida.
        pause
        goto :select_location
    )
)

goto download

:download
cls
echo Descargando %repo%...
echo/
echo [..        ]
timeout /t 1 /nobreak >nul
cls
echo Descargando %repo%...
echo/
echo [..\       ]
timeout /t 1 /nobreak >nul
cls
echo Descargando %repo%...
echo/
echo [...\      ]
timeout /t 1 /nobreak >nul
cls
echo Descargando %repo%...
echo/
echo [...\     ]
timeout /t 1 /nobreak >nul
cls
echo Descargando %repo%...
echo/
echo [....\    ]
timeout /t 1 /nobreak >nul
cls
echo Descargando %repo%...
echo/
echo [.....\   ]
timeout /t 1 /nobreak >nul
cls
echo Descargando %repo%...
echo/
echo [......\  ]
timeout /t 1 /nobreak >nul
cls
echo Descargando %repo%...
echo/
echo [.......\ ]
timeout /t 1 /nobreak >nul
cls
echo Descargando %repo%....
echo/
echo [........]
timeout /t 1 /nobreak >nul

curl -s -L https://github.com/NakamaStream/%repo%/archive/refs/heads/master.zip -o "%download_path%\%repo%.zip"

if %errorlevel% neq 0 (
    echo Fallo al descargar %repo%.
    pause
    goto :menu
) else (
    echo %repo% descargado exitosamente.
    pause
    goto :menu
)

:extra
cls
echo -----------------------------------------
echo               Créditos
echo -----------------------------------------
echo Este proyecto está siendo desarrollado por:
echo - staFF6773
echo - Cristofer543
echo - SantiagolxxGG
echo -----------------------------------------
echo Patrocinado por SstudiosDev Programming Studio.
echo/
echo Agradecimientos especiales a:
echo - akit por sus contribuciones.
echo -----------------------------------------
echo Para más información, visita nuestro sitio web en:
echo https://github.com/NakamaStream
echo -----------------------------------------
pause
goto :menu

:eof
echo Saliendo...
pause
