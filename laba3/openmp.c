#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <math.h>
#include <time.h>
#include <windows.h>


void *heavy_task(int thread_num) {
  int limit = 1e8;

  for (int i = 0; i < limit; i++) {
    sqrt(i);
  }
  printf("\tThread #%d finished\n", thread_num);
}

void openmp(int thread_num) {
  // omp_set_dynamic(0);
  // omp_set_num_threads(thread_num);
//   printf("OpenMP threads: %d\n", omp_get_num_threads());
  #pragma omp parallel for num_threads(thread_num)
  for (int i = 0; i < thread_num; i++) {
    printf("OpenMP thread: %d\n", i);
    heavy_task(i);
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
  openmp(threads_num);
  clock_gettime(CLOCK_MONOTONIC, &end);


  double elapsed_ms = (end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_nsec - start.tv_nsec) / 1e6;
  printf("%d потоков за %.3f мс.\n",threads_num, elapsed_ms);
  return 0;
}

// gcc -o opm openmp.c -fopenmp -lm
// ./opm 10