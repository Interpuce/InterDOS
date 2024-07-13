@echo off
cd %~dp0
color 0f
cls

echo ==================================================================
echo                         InterDOS loader
echo ==================================================================
echo Created by Interpuce Team, licensed as MIT
echo Setting required variables...

set "os.debug=0"
set "fs.defaultPath=%~dp0"

call system/env_var.cmd

cls

echo ==================================================================
echo                         InterDOS loader
echo ==================================================================
echo Created by Interpuce Team, licensed as MIT
echo Loading drivers...

call "system/drivers/utf8.cmd"

cls

echo ==================================================================
echo                         InterDOS loader
echo ==================================================================
echo Created by Interpuce Team, licensed as MIT
echo Loading OS...

ping localhost -n 2 > nul

cls
call system/loginSv.bat