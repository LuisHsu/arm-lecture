#include <stdio.h>
#include <time.h>

extern int fibonacci(int term, int val, int prev);


int main(int argc, char **argv)
{
	int number=0;
	int result=0;		
	clock_t c_start=clock();
	
	scanf("%d",&number);
	
	result = fibonacci(number,1,0);
	
	printf("%d\n",clock()-c_start);
	
	printf("The fibonacci sequence at %d is: %d\n", number, result);
	return 0;
}

