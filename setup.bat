@echo off
cd %~dp0

color 0f
cls

echo ==================================================================
echo                         InterDOS loader
echo ==================================================================
echo Created by Interpuce Team, licensed as MIT
echo Setting up OS...

set "os.debug=0"
set "fs.defaultPath=%~dp0/home"
set "fs.path=/"
set "fs.realPath=%fs.defaultPath%/"

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
echo Logging in...

ping localhost -n 1 > nul

cls
call system/login.bat
