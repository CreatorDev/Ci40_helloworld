/****************
* Ci40-LED-flasher.c
* A basic program to flash HEARTBEAT LED (MFIO76) on Ci40 on and off 10 times
*****************/
#include <stdio.h>

int main(void)
{
	// enable MFIO76
	system("echo 76 > /sys/class/gpio/export");
	// configure MFIO76 as an output
	system("echo out > /sys/class/gpio/gpio76/direction");

	int i=0;
	while (i<10)
	{
		system("echo 1 > /sys/class/gpio/gpio76/value");
		sleep(1);
		system("echo 0 > /sys/class/gpio/gpio76/value");
		sleep(1);
		i++;
	}

	// tidy up the use of MFIO76 by disabling it
	system("echo 76 > /sys/class/gpio/unexport");
	
	return 0;
}

