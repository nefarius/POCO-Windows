@echo off
pushd "%~dp0"

call powershell -ExecutionPolicy Bypass -File .\poco_clone.ps1

popd
pause