@ECHO OFF

SET GREENBACK_CYANFRONT=[102;30;4m
SET REDBACK_CYANFRONT=[41;30;4m
SET YELLOWBACK_CYANFRONT=[33;4m
SET RESET=[0m

:: The timer Reference: https://stackoverflow.com/questions/9922498/calculate-time-difference-in-windows-batch-file
REM Setting the timer
SETLOCAL EnableDelayedExpansion
SET "startTime=%time: =0%"

CALL %~1

SET "endTime=%time: =0%"

REM Get elapsed time:
SET "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
SET /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100), elap-=(elap>>31)*24*60*60*100"

REM Convert elapsed time to HH:MM:SS:CC format:
SET /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"

IF NOT %ERRORLEVEL%==0 (
    ECHO %REDBACK_CYANFRONT%ERROR %ERRORLEVEL%%RESET% : %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
    GOTO :EOF)
ECHO %GREENBACK_CYANFRONT%NO ERRORS%RESET% : %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%
:EOF
