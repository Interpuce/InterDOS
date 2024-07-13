@echo off
setlocal enableDelayedExpansion
cls

echo Hello^! This is an InterDOS.
echo Type `help` to get help^!

if not "!os.usern!"=="root" (
    echo.
    call "system\message.bat" warn "You are not running as root. Some things cannot be executed."
)

:input
echo.
set "user.input=placeholder"
set /p "user.input=!os.usern!@!os.pcname! | !os.path! >> "
if "!user.input!"=="placeholder" (
    call "system\message.bat" redmsg "Please enter command"
) else (
    for /f "tokens=1,2,3,4,5,6,7,8,9,10" %%A in ("!user.input!") do (
        if "%%A"=="help" (
            type "system\assets\help.txt"
        )
        if "%%A"=="shutdown" (
            exit
        )
    )

)
goto :input