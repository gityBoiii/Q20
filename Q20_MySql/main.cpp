#include <stdlib.h>
#include <iostream>
#include <Windows.h>

// c++ unicode


#include "mysql_connection.h"
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/prepared_statement.h>

#pragma comment(lib, "debug/mysqlcppconn.lib")

using namespace std;

//for demonstration only. never save your password in the code!
const string server = "tcp://127.0.0.1:3306";
const string username = "root";
const string password = "1234";

std::string Utf8ToMultiByte(std::string utf8_str)
{
	std::string resultString; char* pszIn = new char[utf8_str.length() + 1];
	strncpy_s(pszIn, utf8_str.length() + 1, utf8_str.c_str(), utf8_str.length());
	int nLenOfUni = 0, nLenOfANSI = 0; wchar_t* uni_wchar = NULL;
	char* pszOut = NULL;
	// 1. utf8 Length
	if ((nLenOfUni = MultiByteToWideChar(CP_UTF8, 0, pszIn, (int)strlen(pszIn), NULL, 0)) <= 0)
		return nullptr;
	uni_wchar = new wchar_t[nLenOfUni + 1];
	memset(uni_wchar, 0x00, sizeof(wchar_t) * (nLenOfUni + 1));
	// 2. utf8 --> unicode
	nLenOfUni = MultiByteToWideChar(CP_UTF8, 0, pszIn, (int)strlen(pszIn), uni_wchar, nLenOfUni);
	// 3. ANSI(multibyte) Length
	if ((nLenOfANSI = WideCharToMultiByte(CP_ACP, 0, uni_wchar, nLenOfUni, NULL, 0, NULL, NULL)) <= 0)
	{
		delete[] uni_wchar; return 0;
	}
	pszOut = new char[nLenOfANSI + 1];
	memset(pszOut, 0x00, sizeof(char) * (nLenOfANSI + 1));
	// 4. unicode --> ANSI(multibyte)
	nLenOfANSI = WideCharToMultiByte(CP_ACP, 0, uni_wchar, nLenOfUni, pszOut, nLenOfANSI, NULL, NULL);
	pszOut[nLenOfANSI] = 0;
	resultString = pszOut;
	delete[] uni_wchar;
	delete[] pszOut;
	return resultString;
}


int main()
{
	sql::Driver* driver;
	sql::Connection* con;
	sql::Statement* stmt;
	sql::PreparedStatement* pstmt;

	try
	{
		driver = get_driver_instance();
		con = driver->connect(server, username, password);
	}
	catch (sql::SQLException e)
	{
		cout << "Could not connect to server. Error message: " << e.what() << endl;
		system("pause");
		exit(1);
	}

	con->setSchema("guestbook");

	stmt = con->createStatement();
	sql::ResultSet* resultSet = stmt->executeQuery("select * from guestbook limit 5, 5");

	while (resultSet->next())
	{
		cout << resultSet->getInt("idx") << " : "
			<< Utf8ToMultiByte(resultSet->getString("name")) << " : "
			<< Utf8ToMultiByte(resultSet->getString("content")) << " : "
			<< resultSet->getInt("count") << endl;
	}

	try
	{
		pstmt = con->prepareStatement("insert into guestbook (`name`, `content`, `count`) values ( ? ,?, ? )");
		pstmt->setString(1, "lee");
		pstmt->setString(2, "lee 1234");
		pstmt->setInt(3, 123);
		pstmt->executeQuery();
	}
	catch (sql::SQLException e)
	{
		cout << "Error message: " << e.what() << endl;
		system("pause");
		exit(1);
	}

	stmt->close();
	stmt = con->createStatement();
	sql::ResultSet* resultSet2 = stmt->executeQuery("select * from guestbook order by idx desc limit 0, 5");

	while (resultSet2->next())
	{
		cout << resultSet2->getInt("idx") << " : "
			<< Utf8ToMultiByte(resultSet2->getString("name")) << " : "
			<< Utf8ToMultiByte(resultSet2->getString("content")) << " : "
			<< resultSet2->getInt("count") << endl;
	}


	//	delete resultSet;
		//delete resultSet2;
	delete con;
	system("pause");
	return 0;
}