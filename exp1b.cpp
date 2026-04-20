#include<stdio.h>
#include"Fac.h"

int main()
{
	int i,area,fac=1;
	int num,side;
	
	printf("Enter the number:");
	scanf("%d",&num);
	FAC(num);
	printf("Factorial is %d\n",fac);
	
	printf("Enter the side: ");
	scanf("%d",&side);
	ARS(side);
	printf("Area of square is %d\n",area);
	
	printf("Enter the radius: ");
	scanf("%d",&side);
	ARC(side);
	printf("Area of circle is %d \n",area);
	return 0;
}
