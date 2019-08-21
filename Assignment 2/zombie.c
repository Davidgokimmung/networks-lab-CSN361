#include<stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
	int pid = fork();

	// Parent process
	if (pid > 0)
	{

		sleep(20);
	}

	// Child process
	else
	{
		printf("Child process terminated\n");
		printf("Zombie process...\n");
		exit(0);
	}
	
	return 0;

}
