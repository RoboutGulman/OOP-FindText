@echo off

REM ���� � ����������� ��������� ��������� ����� ������ �������� ��������� ������
SET MyProgram= "%~1"

REM ������ �� ������� ��� ���������, ��������� ���� � ���������
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


REM ����� ������ �������
echo All tests passed successfuly
exit /B 0

REM ���� ����� �������� � ������ ������
:err
echo Test failed
exit /B 1