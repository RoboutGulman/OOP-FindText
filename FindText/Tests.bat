@echo off

REM ���� � ����������� ��������� ��������� ����� ������ �������� ��������� ������
SET MyProgram= "%~1"

REM ������ �� ������� ��� ���������, ��������� ���� � ���������
if %MyProgram%=="" (
	echo Please specify path to program
	exit /B 1
)

REM Find in empty file
 %MyProgram% Empty.txt "a" && goto err
 echo  Test 1 passed

REM Copy non empty file
 %MyProgram% input.txt "pa" || goto err
 echo  Test 2 passed

 REM Run with more arguments
 %MyProgram% Empty.txt "a" 1 "d" && goto err
 echo  Test 3 passed

 REM Run with no arguments
 %MyProgram%  && goto err
 echo  Test 4 passed


REM ����� ������ �������
echo All tests passed successfuly
exit /B 0

REM ���� ����� �������� � ������ ������
:err
echo Test failed
exit /B 1