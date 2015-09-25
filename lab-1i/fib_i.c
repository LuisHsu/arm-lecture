#include <stdio.h>

int main(){
	int n,res;
	scanf("%d",&n);
	if(n<=0){
		printf("0\n");
		return 0;
	}
	if(n==1||n==2){
		printf("1\n");
		return 0;
	}
	int a=1,b=1;
	for(int i=n;i>2;--i){
		res=a+b;
		a=b;
		b=res;
	}
	printf("%d\n",res);
	return 0;
}
