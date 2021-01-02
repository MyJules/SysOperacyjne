#include <iostream>
#include <pthread.h>

#define NUM_THREADS 8

void *printHello(void *threadid)
{
    long tid;
    tid = (long)threadid;
    std::cout << "Hello SCR. Written by thread: " << tid << std::endl;
    pthread_exit(NULL);
}

int main()
{
    pthread_t threads[NUM_THREADS];
    int threadCheck;

    for (long i = 0; i < NUM_THREADS; i++)
    {
        threadCheck = pthread_create(&threads[i], NULL, printHello, (void *)i);

        if (threadCheck != 0)
        {
            std::cout << "Error: unable to create thread," << threadCheck << std::endl;
            exit(-1);
        }
        //wykonać wszystkie wątki w kolejności od 0 do 9
        //pthread_join(threads[i], NULL);
    }
    pthread_exit(NULL);
}