@echo off
setlocal enableDelayedExpansion

:main
cls
    echo.
    echo    ╔══════════════════════════════════╗
    echo    ║           Please login           ║
    echo    ╠══════════════════════════════════╣
    echo    ║                                  ║
    echo    ║             ◆ root               ║
    echo    ║             ◆ guest              ║
    echo    ║                                  ║
    echo    ╚══════════════════════════════════╝
    echo.
    set /p "os.usern=Username >> "
    if exist "home/!os.usern!/userData.bat" (
        call "home/!os.usern!/userData.bat"
        if not "!user.passkey!"=="...none" (
            goto :password_chk
        ) else (
            call system/terminal.bat
        )
    ) else (
        goto :fn_invalid
    )

goto :main

:password_chk
    cls
    echo.
    echo    ╔══════════════════════════════════╗
    echo    ║          Enter password          ║
    echo    ╠══════════════════════════════════╣
    echo    ║                                  ║
    echo    ║      Enter password to login     ║
    echo    ║                                  ║
    echo    ╚══════════════════════════════════╝
    echo.
    set /p "os.userpasskey=>> "
    if "!os.userpasskey!"=="!user.passkey!" (
        call system/terminal.bat
    ) else (
        goto :fn_invalid2
    )

:fn_invalid2
    cls
    echo.
    echo    ╔══════════════════════════════════╗
    echo    ║              Warning             ║
    echo    ╠══════════════════════════════════╣
    echo    ║                                  ║
    echo    ║         Invalid password         ║
    echo    ║                                  ║
    echo    ╚══════════════════════════════════╝
    echo.
    pause > nul
    goto :password_chk

:fn_invalid
cls
echo.
echo    ╔══════════════════════════════════╗
echo    ║              Warning             ║
echo    ╠══════════════════════════════════╣
echo    ║                                  ║
echo    ║         Invalid username         ║
echo    ║                                  ║
echo    ╚══════════════════════════════════╝
echo.
pause > nul
goto :main