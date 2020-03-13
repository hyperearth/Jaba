@echo off
set VSCMD_START_DIR=.
call "H:\Program Files\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
lib /machine:"amd64" %*
