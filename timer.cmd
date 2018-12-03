@echo off

:: loops echo bell character after specified minutes

IF [%1] == [] (
  SET /P input="Enter minutes: "
) ELSE (
  SET input=%1
)
GOTO check

:restart
SET /P input="Enter minutes: "

:: checks if input is a number
:check
@ECHO %input%|findstr "^[0-9][0-9]*$" >nul && (
  GOTO loopTimer
) || (
  GOTO restart
)

:loopTimer
IF %input%==0 (
  @ECHO Alarm started
  GOTO loopBell
) ELSE IF %input%==1 (
  @ECHO Alarm starts after %input% minute
) ELSE (
  @ECHO Alarm starts after %input% minutes
)
SLEEP 60
SET /A input=input-1
GOTO loopTimer

:loopBell
:: echo bell character
@ECHO 
SLEEP 1
GOTO loopBell