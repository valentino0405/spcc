%option noyywrap

%{
#include<stdio.h>
int vcount=0,ccount=0;
%}

vowel [aeiouAEIOU]
consonant [bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]

%%
{vowel} vcount++;
{consonant} ccount++;
"\n" printf("\nTotal Vowels:%d \nTotal Consonants:%d",vcount,ccount);
%%

int main()
{
	printf("Give input: ");
	yylex();
	return 0;
}
