@echo off
:js-to-exe
set /p folder=full location: 
echo Confirm that the software you are currently using is installed on the c drive
pause
cls
echo [1] to Converter [2] to exit
set /p if=number: 
if %if%==1 start cmd /k pkg %folder%
if %if%==2 exit
pause

