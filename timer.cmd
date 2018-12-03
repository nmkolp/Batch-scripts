@echo off

IF [%1] == [] (
  SET /P input="Enter minutes: "
) ELSE (
  SET input=%1
)
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
IF %input%==0 (
  @ECHO Timer started
  GOTO loopBell
) ELSE IF %input%==1 (
  @ECHO Timer starts after %input% minute
) ELSE (
  @ECHO Timer starts after %input% minutes
)
SLEEP 60
SET /A input=input-1
GOTO loopTimer

:loopBell
@ECHO 
SLEEP 1
GOTO loopBell