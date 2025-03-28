#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <windows.h>

void sequential_mul(float a[], float b[], float c[]) {
    for (int i = 0; i < 4; i++) {
        c[i] = a[i] * b[i]; 
    }
}

int main(int argc, char** argv) {
    struct timespec start, end;
    if (argc < 2){
        printf("No arguments detected.\n");
        return 1;
    }
    
    SetConsoleOutputCP(65001);
    clock_gettime(CLOCK_MONOTONIC, &start);

    int iterations_num = atoi(argv[1]);

    float a[] = {10.0, 20.0, 30.0, 40.0};
    float b[] = {1.5, 2.5, 3.5, 4.5};
    float c[] = {0, 0, 0, 0};

    for (int i = 0; i < iterations_num; i++) {
        sequential_mul(a, b, c);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);

    double elapsed_ms = (end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_nsec - start.tv_nsec) / 1e6;
    printf("%d последовательных итераций за %.3f мс.\n", iterations_num, elapsed_ms);

    return 0;
}

// gcc -o seq seq.c
// gcc -o sse sse.c
// gcc - S sse.c
// ./seq 10000000
// ./sse 10000000