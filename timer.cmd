@echo off

:: loops echo the bell character after specified minutes

:: the bell character is invisible
SET bell=

IF [%1] == [] (
  CALL :inputMinutes
) ELSE (
  SET input=%1
)

FOR /L %%i IN (%input%,-1,1) DO (
  IF %%i==1 (
    @ECHO Alarm starts after 1 minute
  ) ELSE (
    @ECHO Alarm starts after %%i minutes
  )
  TIMEOUT /T 60 /nobreak >nul
)

@ECHO Alarm started

CALL :loopBell

:: Subroutines

:loopBell
  @ECHO %bell%
  TIMEOUT /T 1 /nobreak >nul
  GOTO :loopBell

:inputMinutes
  SET /P input="Enter minutes: "
  @ECHO %input%| findstr "^[0-9][0-9]*$" >nul
  IF errorlevel 1 (
    GOTO :inputMinutes
  )
  EXIT /B
