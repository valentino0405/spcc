%option noyywrap

%{
#include<stdio.h>
%}

correct A[A-Za-z]{2}
incorrect [A-Za-z]+

%%
{correct} printf(yytext);
{incorrect}
%%

int main(){

	printf("Give Input: ");
	yylex();
	return 0;
}
