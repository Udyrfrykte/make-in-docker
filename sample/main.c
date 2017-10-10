#include<stdio.h>

int main(int argc, char* argv[])
{
    if(argc > 1)
        printf("Hello World %s !", argv[1]);
    else
        printf("Hello World to nobody !");
    return 0;
}
