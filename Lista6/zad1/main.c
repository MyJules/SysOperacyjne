#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>

void printMenu()
{
    printf("Please write file name:\n");
}

int main()
{
    int dis;
    char fileName[1024];
    struct stat filestat;
    char *map;

    while(1)
    {
        printf("q - quit program\n");
        printMenu();
        scanf("%s", fileName);

        if (fileName[0] == 'q')
            return 0;

        dis = open(fileName, O_RDONLY);

        if (stat(fileName, &filestat) < 0)
        {
            printf("Bad file stats!!!\n");
            return 1;
        }

        ftruncate(dis, filestat.st_size);
        map = mmap(0, filestat.st_size, PROT_READ, MAP_SHARED, dis, 0);
        read(dis, map, filestat.st_size);
        //write to disc
        msync(0, filestat.st_size, dis);
        printf("Mapped file: %s \n",  map);
        
        close(dis);
    }
    return 0;
}
