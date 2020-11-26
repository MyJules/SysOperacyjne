#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#define BUFSIZE 256

int main(int argc, char *argv[])
{
  pid_t pid;
  int fd[2], in_fd, n;
  char buf[BUFSIZE];

  if (pipe(fd) < 0)
  {
    fprintf(stderr, "pipe error\n");
    _exit(1);
  }

  pid = fork();

  if (pid == 0)
  {
    close(fd[1]);
    while (read(fd[0], &buf, 2) > 0)
    {
      write(STDOUT_FILENO, "#", 1);
      write(STDOUT_FILENO, &buf, 2);
      write(STDOUT_FILENO, "#", 1);
      write(STDOUT_FILENO, "\n", 1);
    }
    close(fd[0]);
  }

  else if (pid > 0)
  {
    close(fd[0]);
    //scanf("%s",fname);
    if ((in_fd = open(argv[1], O_RDONLY)) < 0)
    {
      fprintf(stderr, "error\n");
      return 1;
    }

    while ((n = read(in_fd, &buf, BUFSIZE)) > 0)
    {
      if (write(fd[1], &buf, n) < 0)
      {
        fprintf(stderr, "error\n");
        return 1;
      }
    }
    close(in_fd);
  }
  return 1;
}