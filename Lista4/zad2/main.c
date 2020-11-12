#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <signal.h>

int flag;

void printAndExit(int signum)
{
  printf("\n Caought signal %d\n", signum);
  exit(signum);
}

void printAndContinue(int signum)
{
  printf("\n Caught singal %d \n", signum);
}

void waitAndContinue(int signym)
{
  flag ^= 1;

}

int main()
{
  flag = 0;
  //wyswietliamy numer sygnalu i konczymy program
  signal(SIGALRM, printAndExit);
  //wsywietliamy numer sygnalu i kontynujemy program
  signal(SIGTERM, printAndContinue);
  //czytamy przy odczytaniu sygnalu
  signal(SIGUSR1, waitAndContinue);
  //Ignorujemy sygnla
  signal(SIGUSR2, SIG_IGN);

  while(1)
  {
    printf("sdf\n");
    sleep(2);
  }

  return 0;
}
