@echo off
setlocal enableDelayedExpansion
cls

:input
set "user.input=placeholder"
set /p "user.input=!os.usern!@!os.pcname! | !os.path! >> "
if "!user.input!"=="placeholder" (
    call "system\messege.bat" redmsg "Please enter command"
) else (
    for /f "tokens=1,2,3,4,5,6,7,8,9,10" %%A in ("!user.input!") do (
        if "%%A"=="diskinfo" (
            call system\console\diskinfo.cmd
        )
    )

)
goto :input