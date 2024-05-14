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
set /p choice=Seleccione una opción: 

if "%choice%"=="1" goto repositorio
if "%choice%"=="2" goto extra
if "%choice%"=="3" goto :eof

echo Opción no válida. Por favor seleccione una opción válida.
pause
goto :menu

:repositorio
cls
echo -----------------------------------------
echo      Seleccione un Repositorio para Descargar
echo -----------------------------------------
echo/
echo 1. [ NakamaStream ]
echo 2. [ NakamaStream-Android ]
echo 3. [ NakamaStream-Batch ]
echo 4. [ Volver al Menú Principal ]
echo -----------------------------------------
set /p repo_choice=Seleccione un repositorio: 

if "%repo_choice%"=="1" (
    set repo=NakamaStream
    goto seleccionar_ruta
)

if "%repo_choice%"=="2" (
    set repo=NakamaStream-Android
    goto seleccionar_ruta
)

if "%repo_choice%"=="3" (
    set repo=NakamaStream-Batch
    goto seleccionar_ruta
)

if "%repo_choice%"=="4" goto :menu

echo Opción no válida. Por favor seleccione una opción válida.
pause
goto :repositorio

:seleccionar_ruta
cls
echo -----------------------------------------
echo     Seleccione la ubicación de descarga
echo -----------------------------------------
echo/
echo 1. [ Escritorio ]
echo 2. [ Descargas ]
echo 3. [ Ruta Personalizada ]
echo -----------------------------------------
set /p location_choice=Seleccione una ubicación: 

if "%location_choice%"=="1" (
    set "download_path=%USERPROFILE%\Desktop"
)

if "%location_choice%"=="2" (
    set "download_path=%USERPROFILE%\Downloads"
)

if "%location_choice%"=="3" (
    set /p "download_path=Ingrese la ruta personalizada (por ejemplo, C:\ruta\a\carpeta): "
)

if "%location_choice%"=="3" (
    if not exist "%download_path%" (
        echo Ruta no válida. Por favor seleccione una ruta válida.
        pause
        goto :seleccionar_ruta
    )
)

goto descargar

:descargar
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
echo Descargando %repo%...
echo/
echo [........]
timeout /t 1 /nobreak >nul

curl -s -L https://github.com/NakamaStream/%repo%/archive/refs/heads/master.zip -o "%download_path%\%repo%.zip"

if %errorlevel% neq 0 (
    echo Error al descargar %repo%.
) else (
    echo %repo% descargado correctamente.
)

pause
goto :menu

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
echo Para más información, visite nuestro sitio web en:
echo https://github.com/NakamaStream
echo -----------------------------------------
pause
goto :menu

:eof
echo Saliendo...
pause
