%option noyywrap

%{
#include<stdio.h>
%}

correct [A-Za-z]+(abb)
incorrect [A-Za-z]+

%%
{correct} printf("String is Valid");
{incorrect} printf("String is not Valid");
%%

int main()
{
	printf("Enter a string: ");
	yylex();
	return 0;
}
