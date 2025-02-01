
@echo on

set target_version=3.10.1

set target_python=python-%target_version%.exe
set target_pythondir="%~dp0\Python%target_version%"
set tmp_dir="%~dp0\Python_tmp"


:: Define the URL and output file"
set URL="https://www.python.org/ftp/python/%target_version%/%target_python%"
set OUTPUT=%target_python%

:: Check if the file already exists
if exist %OUTPUT% (
    echo File already exists. Skipping download.
    goto end
)

:: Check if the URL exists
curl --head --silent --fail %URL% >nul 2>&1
if errorlevel 1 (
    echo URL does not exist or is unreachable.
    goto end
)

:: Use curl to download the file
curl -o %OUTPUT% %URL%

:: Check if the download was successful
if exist %OUTPUT% (
    echo Download successful!
) else (
    echo Download failed!
	goto end
)

goto end

echo First: Install, unfortunately, Python wants to change the registry
%target_python% /quiet InstallAllUsers=0  TargetDir=%tmp_dir% AssociateFiles=0 Shortcuts=0 Include_doc=0 Include_launcher=0 

echo Second: Copy 
xcopy %tmp_dir% %target_pythondir% /E /I /H
 
echo Thrid: Uninstall to clean up the registry
%target_python% /quiet /uninstall


del %OUTPUT%

echo successful
goto quit


:end
echo ERRORS, please check and retry


:quit

