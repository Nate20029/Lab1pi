#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h> 

void Usage(char* prog_name);

int main(int argc, char* argv[]) {
    long long n, k;
    int thread_count;
    double sum_odd = 0.0;
    double sum_even = 0.0;
    double sum;

    if (argc != 3) {
        Usage(argv[0]);
    }
    
    thread_count = strtol(argv[1], NULL, 10);
    n = strtoll(argv[2], NULL, 10);

    #pragma omp parallel for num_threads(thread_count) \
        reduction(+: sum_odd) reduction(+: sum_even) 
    for (k = 0; k < n; k++) {
        if (k % 2 == 0) { // even terms
            sum_even += 1.0/(2*k + 1);
        } else { // odd terms
            sum_odd += 1.0/(2*k + 1);
        }
    }

    sum = sum_even - sum_odd;
    sum = 4.0 * sum;
    
    printf("With n = %lld terms and %d threads,\n", n, thread_count);
    printf("   Our estimate of pi = %.14f\n", sum);
    printf("                   PI = %.14f\n", 4.0*atan(1.0));

    return 0;
} /* main */

void Usage(char* prog_name) {
    fprintf(stderr, "usage: %s <thread_count> <n>\n", prog_name);
    exit(0);
}  /* Usage */
