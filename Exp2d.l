%option noyywrap

%{
#include<stdio.h>
int a;
%}

%%
[0-9]+ {

	a=atoi(yytext);
	if(a%2==0){
	printf("Number is Even");	
}
else{
	printf("Number is odd");
}
}
"\n" printf("\nEnter a number: ");


%%


int main()
{
printf("Enter a number:");
yylex();
return 0;
}
