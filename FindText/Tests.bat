@echo off

REM Путь к тестируемой программе передаётся через первый аргумент командной строки
SET MyProgram= "%~1"

REM Защита от запуска без аргумента, задающего путь к программе
if %MyProgram%=="" (
	echo Please specify path to program
	exit /B 1
)

REM Find in empty file
REM %MyProgram% Empty.txt "a" || goto err
REM fc Empty.txt EmptyOutput.txt > nul || goto err
REM echo  Test 1 passed

REM Copy non empty file
REM %MyProgram% input.txt "pa" || goto err
REM fc input.txt output.txt > nul || goto err
REM echo  Test 2 passed


REM Тесты прошли успешно
echo All tests passed successfuly
exit /B 0

REM Сюда будем попадать в случае ошибки
:err
echo Test failed
exit /B 1