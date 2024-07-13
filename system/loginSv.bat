@echo off

:main
cls
    echo.
    echo    ╔══════════════════════════════════╗
    echo    ║           Please login           ║
    echo    ╠══════════════════════════════════╣
    echo    ║                                  ║
    echo    ║             ◆ Root               ║
    echo    ║             ◆ Guest              ║
    echo    ║                                  ║
    echo    ╚══════════════════════════════════╝
    echo.
    set /p "sys.usern=usern >> "
    if exist "..\home\!sys.usern!" (
        call "..\home\!sys.usern!\userData.bat"
        goto :password_chk
        call system\terminal.bat
    ) else (
        goto :fn_invalid
    )

goto :main

:fn_invalid
        cls
        echo.
        echo    ╔══════════════════════════════════╗
        echo    ║           Please login           ║
        echo    ╠══════════════════════════════════╣
        echo    ║                                  ║
        echo    ║         Invalid username         ║
        echo    ║                                  ║
        echo    ╚══════════════════════════════════╝
        echo.
        pause > nul
        goto :main

:password_chk
    echo.
    echo    ╔══════════════════════════════════╗
    echo    ║          Enter password          ║
    echo    ╠══════════════════════════════════╣
    echo    ║                                  ║
    echo    ║      Enter password to login     ║
    echo    ║                                  ║
    echo    ╚══════════════════════════════════╝
    echo.
    set /p "sys.userpasskey=>>"
    if "sys.userpasskey"=="user.passkey" (
        call system\terminal.bat
    ) else (
        goto :fn_invalid2
    )

:fn_invalid2
        cls
        echo.
        echo    ╔══════════════════════════════════╗
        echo    ║           Please login           ║
        echo    ╠══════════════════════════════════╣
        echo    ║                                  ║
        echo    ║         Invalid password         ║
        echo    ║                                  ║
        echo    ╚══════════════════════════════════╝
        echo.
        pause > nul
        goto :password_chk
