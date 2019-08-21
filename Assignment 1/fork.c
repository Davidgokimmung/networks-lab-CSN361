#include <unistd.h>
#include <stdio.h>

int main()
{
    int c1,c2;
    c1 = fork();
    if(c1==0)
    {
        printf("Child 1 : %d\n",getpid());
        int g1,g2;
        g1 = fork();
        if(g1==0)
        {
           printf("GrandChild 1 of Child 1  : %d\n",getpid());
        }
        else
        {
            g2=fork();
            if(g2==0)
            {
                printf("GrandChild 2 of Child 1  : %d\n",getpid());
            }
        }   
    }
    else
    {
        c2=fork();
        if(c2==0)
        {
            printf("Child 2 : %d\n",getpid());
            int g1,g2;
             g1 = fork();
             if(g1==0)
            {
                printf("GrandChild 1 of Child 2  : %d\n",getpid());
            }
            else
            {
            g2=fork();
            if(g2==0)
            {
                printf("GrandChild 2 of Child 2  : %d\n",getpid());
            }
            
            }
        }
        else
        {
			sleep(1);
            printf("Parent : %d\n",getppid());
        }
    }
    return 0;
}
