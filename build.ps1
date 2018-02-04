$git = Join-Path -Path (Get-ItemProperty -Path 'HKLM:SOFTWARE\GitForWindows' -Name InstallPath).InstallPath -ChildPath 'bin\git.exe'

Write-Host "Cloning repository..."
Start-Process -PassThru -Wait -WindowStyle Hidden -FilePath $git -ArgumentList 'clone -b poco-1.8.1 https://github.com/pocoproject/poco.git'
Write-Host "Cloning finished!"

Write-Host "Fetching latest nuget client binary..."
Invoke-WebRequest -Uri "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile "nuget.exe"
Write-Host "Nuget downloaded!"