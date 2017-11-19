@echo off
@setlocal

pushd "%~dp0"

IF NOT EXIST "poco" (
    echo poco folder not found, did you forget to clone?
    exit /B -1
)

rem Only build basic components
copy /Y components.txt poco\components

rem Build x64
IF EXIST "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat" (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
    cd poco
    call buildwin 150 build shared both x64 nosamples
    call buildwin 150 build static_mt both x64 nosamples
)

rem Build x86
IF EXIST "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat" (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"
    cd poco
    call buildwin 150 build shared both Win32 nosamples
    call buildwin 150 build static_mt both Win32 nosamples
)

rem Build NuGet package
cd ..
call nuget pack POCO-Basic.nuspec -NoPackageAnalysis -NonInteractive

popd
endlocal
pause