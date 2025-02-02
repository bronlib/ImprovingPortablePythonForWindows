@echo off


:: Define the target URL
set URL=https://www.python.org/ftp/python/


:: Fetch the directory listing and save it to a file
curl  %URL% | findstr /B /r /c:"<a href=.[3]"  > temp.html

(for /f "tokens=2" %%a in (temp.html) do (echo %%a )) > filter.txt
(for /f tokens^=^2^ Delims^=^"  %%a in (filter.txt) do (echo %%a) ) > filter2.txt
(for /f tokens^=^1^ Delims^=/  %%a in (filter2.txt) do (echo %%a) ) > dirnames.txt

del temp.html
del filter.txt
del filter2.txt

:ff

(for /f %%a in (dirnames.txt) do (^
curl --head --silent --fail %URL%/%%a/python-%%a.exe >nul 2>&1  
if not errorlevel 1 echo %%a
)) > validdirs.txt


:quit
