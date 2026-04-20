%option noyywrap

%{
#include<stdio.h>
#include<stdlib.h>
#include"CalcY.tab.h"
%}

%%
[0-9]+ {
	yylval=atoi(yytext);
	return NUM;
}
[\t];
[\n] return 0;
. return yytext[0];
%%
