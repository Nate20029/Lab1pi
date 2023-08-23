#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h> 
/* 
    Esta es una versión modificada de Naive que permite  el uso de parametros para cambiar las políticas de openmp así como el tamaño de los bloques. 

 */
void Usage(char* prog_name);

int main(int argc, char* argv[]) {
   long long n, k;
   int thread_count;
   double factor = 1.0;
   double sum = 0.0;
   double start, finish;

   if (argc != 3) Usage(argv[0]);
   
   thread_count = strtol(argv[1], NULL, 10);
   n = strtoll(argv[2], NULL, 10);

   start = omp_get_wtime();
#  pragma omp parallel for num_threads(thread_count) \
      reduction(+: sum) schedule(runtime)
   for (k = 0; k < n; k++) { 
      sum += factor/(2*k+1);
      factor = -factor;
   }
   finish = omp_get_wtime();

   sum = 4.0*sum;
   /*    printf("With n = %lld terms and %d threads,\n", n, thread_count);
   printf("   Our estimate of pi = %.14f\n", sum);
   printf("                   PI = %.14f\n", 4.0*atan(1.0)); */
   printf("Time elapsed = %e seconds\n", finish - start);

   return 0;
}  /* main */

void Usage(char* prog_name) {
   fprintf(stderr, "usage: %s <thread_count> <n>\n", prog_name);
   exit(0);
}  /* Usage */
