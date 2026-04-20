%option noyywrap

%{

	#include<stdio.h>
%}

%%
"\n" printf("Hello World");
%%

int main(){
	printf("Give input:");
	yylex();
	return 0;
}
