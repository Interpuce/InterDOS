@echo off
setlocal enableDelayedExpansion
cls

:input
set "user.input=placeholder"
set /p "user.input=!sys.usern!@!sys.pcname! | !sys.path! >> "
if "!user.input!"=="placeholder" (
    call "system\messege.bat" redmsg "Please, enter command"
) else (
    for /f "tokens=1,2,3" %%A in ("!user.input!") do (
        if "%%A"=="diskinfo" (
            call system\console\diskinfo.cmd
        )
    )

)
goto :input

set "text=!line:*else=!"