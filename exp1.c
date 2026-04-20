#include<stdio.h>
#include"cal.h"

int main(){
	
	int choice;
		do{
			printf("1.Addition\n 2.Subtraction\n 3.Multiplication \n 4.Division \n 5. Modulo \n 6.Exit");
			
			printf("Enter choice:");
			scanf("%d",&choice);
			
			int a,b ;
			printf("Enter two numbers: ");
			scanf("%d %d",&a,&b);
			
			switch(choice){
				case 1:
					printf("Addition is %d\n",add(a,b));
					break;
				
				case 2:
					printf("Subtraction is %d\n",sub(a,b));
					break;
				
				case 3:
					printf("Mulitplication is %d\n",mul(a,b));
					break;
				
				case 4:
					printf("Division is %d\n",div(a,b));
					break;
					
				case 5:
					printf("Modulo is %d\n",mod(a,b));
					break;
					
				default:
					printf("Invalid choice");
					
			}
			printf("\n");
			
		} while(choice!=6);
	return 0;
}
