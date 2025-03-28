#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <windows.h>

void sse(float a[], float b[], float c[]) {
    asm volatile (
                  "movups %[a], %%xmm0\n"
                  "movups %[b], %%xmm1\n"
                  "mulps %%xmm1, %%xmm0\n"
                  "movups %%xmm0, %[c]\n"
                  :
                  : [a]"m"(*a), [b]"m"(*b), [c]"m"(*c)
                  : "%xmm0", "%xmm1");
    // for (int i = 0; i < 4; i++) {
    //   printf("%f ", c[i]);
    // }
    // printf("\n");
}
  
int main(int argc, char** argv) {
    struct timespec start, end;
    if (argc < 2){
        printf("No arguments is detected");
        return 1;
    }
    SetConsoleOutputCP(65001);
    clock_gettime(CLOCK_MONOTONIC, &start);
    int iterations_num = atoi(argv[1]);

    float a[] = {10.0, 20.0, 30.0, 40.0};
    float b[] = {1.5, 2.5, 3.5, 4.5};
    float c[] = {0, 0, 0, 0};
    
    for (int i = 0; i < iterations_num; i++) {
        sse(a, b, c);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);

    double elapsed_ms = (end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_nsec - start.tv_nsec) / 1e6;
    printf("%d параллельных итераций за %.3f мс.\n", iterations_num, elapsed_ms);
    return 0;
}