#include <stdio.h>

extern int fibonacci(int term, int val, int prev);

int main(int argc, char **argv)
{
	int number=0;
	int result=0;
	
	int c_start=0;
	asm("mov %0, #2" : "=r"(c_start));
	printf("%d\n",c_start);
	
	scanf("%d",&number);
	result = fibonacci(number,1,0);
	printf("The fibonacci sequence at %d is: %d\n", number, result);
	return 0;
}

