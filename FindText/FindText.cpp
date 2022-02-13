// FindText.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.

#include <iostream>
#include <fstream>
#include <optional>
#include <string>
#include "FindText.h"

using namespace std;

struct Args
{
	string FileName;
	string SearchText;
};

std::optional<Args> ParseArgs(int argc, char* argv[])
{
	if (argc != 3)
	{
		cout << "Invalid arguments count\n";
		cout << "Usage: findtext.exe <file name> <text to search>\n";
		return nullopt;
	}
	Args args;
	args.FileName = argv[1];
	args.SearchText = argv[2];
	return args;
}



int main(int argc, char* argv[])
{
	auto args = ParseArgs(argc, argv);
	// Проверка правильности аргументов командной строки
	if (!args)
	{
		return 1;
	}

	//Открываем файл
	ifstream input;
	input.open(args->FileName);
	if (!input.is_open())
	{
		cout << "Failed to open '" << args->FileName << "' for reading\n";
		return 1;
	}

	//Читаем файл в переменную
	string buffer=FileToString(input);

	string searchText = args->SearchText;
	if (!FindString(buffer, searchText))
	{
		cout << "Text not found\n";
		return 1;
	}

	if (input.bad())
	{
		cout << "Failed to read data from input file\n";
		return 1;
	}

	return 0;
}

bool FindString(std::string& buffer, std::string& searchText)
{
	bool isFind = false;
	int i = 0;

	for (i = buffer.find(searchText, i++); i != string::npos; i = buffer.find(searchText, i + 1))
	{ 
		if (!isFind) isFind = true;
		cout << i << endl;
	}
	return isFind;
}

char* FileToString(std::ifstream& input)
{
	int length;
	char* buffer;

	// получаем длинну файла:
	input.seekg(0, ios::end);
	length = input.tellg();
	input.seekg(0, ios::beg);

	// выделяем память:
	buffer = new char[length];
	// читаем данные:
	input.read(buffer, length);
	input.close();
	return buffer;
}

