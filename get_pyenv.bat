@echo OFF

set python_version=3.10.0

set URL="https://github.com/pyenv-win/pyenv-win/archive/refs/heads/master.zip"
::set URL="https://github.com/pyenv-win/pyenv-win/archive/master.zip/"
set OUTPUT="pyenv-win-master.zip"


set startdir="%~dp0"
set PYENV=%startdir%\.pyenv\pyenv-win
set PYENV_ROOT=%startdir%\.pyenv\pyenv-win
set PYENV_HOME=%startdir%\.pyenv\pyenv-win
set PATH=%startdir%\.pyenv\pyenv-win\bin;%PATH%

goto installversion

REM  curl to download the file
curl -L  %URL% --output %OUTPUT%

:: Check if the download was successful
if exist %OUTPUT% (
    echo Download successful!	
) else (
    echo Download failed!
	goto end
)

tar -xf %OUTPUT%

:afterdownload


rename pyenv-win-master  .pyenv

:installversion

cd %PYENV%\bin

call pyenv.bat --version

::call pyenv install  %python_version%


cd %startdir%
move .pyenv\pyenv-win\versions\3.10.0  win-Python-3.10.0
rmdir /s /q .pyenv   
del pyenv-win-master.zip




:end