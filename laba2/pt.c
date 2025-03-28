#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>
#include <time.h>
#include <windows.h>

int counter = 0;

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;


void *heavy_task(void *i) {
  int thread_num = *((int*) i);

  for (int i = 0; i < 1e8; i++) {
    sqrt(i);
  }

  printf("\tThread #%d finished\n", thread_num);
  free(i);
}

void pthreads(int threads_num) {

  pthread_t threads[threads_num];
  int status;

  for (int i = 0; i < threads_num; i++) {

    printf("MAIN: starting thread %d\n", i);

    int *thread_num = (int*) malloc(sizeof(int));
    *thread_num = i;

    status = pthread_create(&threads[i], NULL, heavy_task, thread_num);

    if (status != 0) {
      fprintf(stderr, "pthread_create failed, error code %d\n", status);
      exit(EXIT_FAILURE);
    }
  }

  for (int i = 0; i < threads_num; i++) {
    pthread_join(threads[i], NULL);
  }
}

int main(int argc, char** argv) {
  struct timespec start, end;
  if (argc < 2){
    printf("No arguments detected.\n");
    return 1;
  }

  SetConsoleOutputCP(65001);
  int threads_num = atoi(argv[1]);

  clock_gettime(CLOCK_MONOTONIC, &start);
  pthreads(threads_num);
  pthread_mutex_destroy(&mutex);
  clock_gettime(CLOCK_MONOTONIC, &end);


  double elapsed_ms = (end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_nsec - start.tv_nsec) / 1e6;
  printf("%d потоков за %.3f мс.\n",threads_num, elapsed_ms);
  return 0;
}