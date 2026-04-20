%option noyywrap

%{
#include<stdio.h>
int keywords=0,punct=0,ops=0,iden=0,lit=0;
%}

DIGIT [0-9]+
ALPHA [a-zA-Z]
ID {ALPHA}({ALPHA}|{DIGIT})*
KEYWORD if|else|while|int|float|return|double
OPERATOR [+*/=%<>-]
PUNCT [()\[\],;:.]

%%
{KEYWORD} {keywords++;}
{PUNCT} {punct++;}
{OPERATOR} {ops++;}
{DIGIT} {lit++;}
{ID} {iden++;}
[\t\n]+ ;
. ;
%%

int main()
{
	printf("Enter your code press ctrl+z when finished:\n");
	yylex();
	printf("\n--Results--\n");
	printf("Keywords: %d\n",keywords);
	printf("Punctutations:%d\n",punct);
	printf("Operators:%d\n",ops);
	printf("Identifiers:%d\n",iden);
	printf("Literals: %d\n",lit);
	
	return 0;
}

