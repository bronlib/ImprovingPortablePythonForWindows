@echo on

goto end
:: Define the target URL
set URL=https://www.python.org/ftp/python/

:: Fetch the directory listing and save it to a file
curl -s %URL% > temp.html

:: Extract lines containing directory names
findstr /B "<a href="  temp.html > raw_list.txt

:: Process the list to extract directory names
for /f "tokens=2 delims=\"" %%A in (raw_list.txt) do (@echo %%A) > dir_list.txt


@echo on
REM setlocal enabledelayedexpansion

set file=raw_list.txt

for /f "tokens=*" %%A in (%file%) do (
    set "line=%%A"
    for /f "delims=" %%B in ('echo !line! ^| findstr /r /o "\"[^\"]*\""') do (
        set "substring=%%B"
        echo !substring!
    )
)

REM endlocal



:end

for  /f "delims=<" %%A in (raw_list.txt) do (type %%A)



