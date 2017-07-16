@echo off

set MYSELF=%~dp0
set POCO=%MYSELF%\poco-1.7.8p2

cd "%POCO%"

IF NOT EXIST "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" (
	echo "Microsoft Visual Studio 2015 not found in default installation dir, can't continue"
	exit /B -1
)

rem Build x64
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
call buildwin 140 build shared both x64 nosamples
call buildwin 140 build static_mt both x64 nosamples

rem Build x86
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86
call buildwin 140 build shared both Win32 nosamples
call buildwin 140 build static_mt both Win32 nosamples
