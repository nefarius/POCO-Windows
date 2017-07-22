@echo off
pushd "%~dp0"

echo Cloning repository...
call git clone -b poco-1.7.8 https://github.com/pocoproject/poco.git
echo Cloning finished!

echo Fetching latest nuget client binary...
call powershell -Command Invoke-WebRequest -Uri "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile "nuget.exe"
echo Nuget downloaded!

popd
pause