/****************
* Ci40_helloworld.c
* A basic program to print a helloworld message 10 times
* The purpose of this app is to run through the cross
* compile process for OpenWrt and package installation 
* using OPKG
*****************/
#include <stdio.h>

int main(void)
{
	int i=0;
	while (i<10)
	{
		printf("Hello world, this is your Ci40 calling\n")
		i++;
	}

	return 0;
}

