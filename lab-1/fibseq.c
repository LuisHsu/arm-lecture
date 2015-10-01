#include <stdio.h>
#include <time.h>

extern int fibonacci(int term, int val, int prev);


int main(int argc, char **argv)
{
	int number=0;
	unsigned int result=0;		
	clock_t c_start=clock();
	
	scanf("%d",&number);
	
	result = fibonacci(number,1,0);
	
	FILE* fout=fopen("clock","a");
	
	fprintf(fout,"%d %d\n",number,clock()-c_start);
	
	printf("The fibonacci sequence at %d is: %ld\n", number, result);
	return 0;
}

