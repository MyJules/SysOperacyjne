#include <stdio.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>
#include <ucontext.h>

int main()
{
  int i = 0;
  while(1)
  {
    ++i;
    //sleep(1);
  }

  return 0;
}
