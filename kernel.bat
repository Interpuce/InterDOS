@echo off
title Kernel
setlocal enableDelayedExpansion

:: Virtual file system loader

set "sys.fs=idfs"
set "sys.workingDir=local/"