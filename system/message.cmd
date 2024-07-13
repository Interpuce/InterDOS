set "string.num2=%2"
set "string.num2=!string.num2:~1,-1!"

if "%1"=="redmsg" (
    echo [91m!string.num2![0m
    goto :end
)

if "%1"=="error" (
    echo [[91merror[0m] !string.num2!
    goto :end
)

if "%1"=="ok" (
    echo [[92mOK[0m] !string.num2!
    goto :end
)

if "%1"=="success" (
    echo [[92msuccess[0m] !string.num2!
    goto :end
)

if "%1"=="warn" (
    echo [[93mwarn[0m] !string.num2!
    goto :end
)

if "%1"=="info" (
    echo [[94minfo[0m] !string.num2!
    goto :end
)

:end
:: Go back to terminal.bat or other console