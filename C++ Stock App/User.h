#include <string>
#include "pch.h"
#pragma once

class User
{
	private:
		std::string name;
		int age;
		int requests = 0;

	public:
		User();
		User(std::string);
		void setName(std::string n);
		void setRequests(int r);
		void setAge(int a);
		int getAge();
		int getRequests();
		std::string getName();
};
