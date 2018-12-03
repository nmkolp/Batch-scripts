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
IF %input%==0 (GOTO bell)
IF %input%==1 @ECHO Timer starts after %input% minute
IF %input% GTR 1 @ECHO Timer starts after %input% minutes
SLEEP 10
SET /A input=input-1
GOTO loopTimer

:bell
@ECHO Timer started
:loopBell
@ECHO 
SLEEP 1
GOTO loopBell