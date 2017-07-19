@echo off
pushd "%~dp0"

echo Cloning repository...

call git clone -b poco-1.7.8 https://github.com/pocoproject/poco.git

echo Cloning finished!

popd
pause