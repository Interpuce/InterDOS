@echo off
setlocal enableDelayedExpansion
set "fs.defaultPath=%fs.defaultPath%/%os.usern%"
cls

echo Hello. This is an InterDOS.
echo Type `help` to get help.

if not "!os.usern!"=="root" (
    echo.
    call "system/message.cmd" warn "You are not running as root. Some things cannot be executed."
)

:input
echo.
set "user.input=placeholder"
set /p "user.input=!os.usern!@!os.pcname!:!fs.path! >> "
if "!user.input!"=="placeholder" (
    call "system/message.cmd" redmsg "Please enter command"
) else (
    for /f "tokens=1,2,3,4,5,6,7,8,9,10" %%A in ("!user.input!") do (
        if "%%A"=="help" (
            if "%%B"=="" (
                type system\assets\help.txt
            )

            if "%%B"=="-c" (
                type system\assets\commands.txt
            )
        )
        if "%%A"=="settings" (
            if not "!os.usern!"=="root" (
                echo.
                call "system/message.cmd" error "You are not running as root."
                goto :input
            )
        )
        if "%%A"=="cd" (
            set "user.input.dir=%%B"
            if "%%B"=="" (
                call "system/message.cmd" error "Please enter directory"
                goto :input
            )

            if "!user.input.dir:~0,1!"=="/" if not "!user.input.dir!"=="/" (
                call "system/message.cmd" info "For now, strings with a slash begin are not supported. Use `cd /` and `cd directory`."
                goto :input
            )

            if "!user.input.dir:~0,2!"==".." if not "!user.input.dir!"==".." (
                call "system/message.cmd" info "For now, strings with a double dot begin are not supported. Use `cd ..` and `cd directory`."
                goto :input
            )

            echo !user.input.dir! | findstr /C:"\\" >nul
            if !errorlevel! equ 0 (
                call "system/message.cmd" error "Only normal slashes are supported"
                goto :input
            )

            echo !user.input.dir! | findstr /C:".." > nul
            if !errorlevel! equ 0 if "!fs.path!"=="/" (
                call "system/message.cmd" error "Cannot use double dot on home directory."
                goto :input
            )

            if "!user.input.dir!"=="/" (
                set "fs.realPath=!fs.defaultPath!/"
                set "fs.path=/"
                goto :input
            )

            if "!user.input.dir!"==".." (
                for %%I in ("!fs.realPath!") do set "fs.realPath=%%~dpI"
                set "fs.realPath=!fs.realPath:~0,-1!"
                set "fs.path=!fs.realPath:!fs.defaultPath!=!"
                if "!fs.path!"=="" set "fs.path=/"
                goto :input
            )

            set "newPath=!fs.realPath!!user.input.dir!\"
            set "newPath=!newPath:/=\!"
            set "newPath=!newPath:\\=\!"
            if exist "!newPath!" (
                set "fs.realPath=!newPath!"
                set "fs.path=!fs.realPath:!fs.defaultPath!=!"
                if "!fs.path!"=="" set "fs.path=/"
            ) else (
                call "system/message.cmd" error "The system cannot find the path specified."
            )
            goto :input
        )
        if "%%A"=="shutdown" (
            exit
        )
    )
)
goto :input