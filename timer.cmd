@echo off

IF NOT ([%1] == []) SET input=%1
IF [%1] == [] SET /P input="Enter minutes: "
GOTO check

:restart
SET /P input="Enter minutes: "

:check
@ECHO %input%|findstr "^[0-9][0-9]*$" >nul && (
  GOTO loopTimer
) || (
  GOTO restart
)

:loopTimer
IF %input%==0 (GOTO loopBell)
@ECHO Timer starts after %input% minutes
SLEEP 10
SET /A input=input-1
GOTO loopTimer

:loopBell
@ECHO 
SLEEP 1
GOTO loopBell